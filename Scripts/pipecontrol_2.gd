extends TextureButton

var rotation_angle = 0
@onready var isConnected = false
@onready var isEnd = false
@onready var isStart = false
@onready var collArea = $Area2D
@onready var clicked = false
signal isWon()

func _ready() -> void:
	self_modulate = Color(0, 0, 0)

func _on_pressed():
	clicked = true
	rotation_angle += 90
	if rotation_angle >= 360:
		rotation_angle = 0
	rotation_degrees = rotation_angle
	await get_tree().create_timer(1.0).timeout
	clicked = false

func lightConnectedAreas():
	var overlappingAreas = collArea.get_overlapping_areas()
	for a in overlappingAreas:
		if(a.get_parent().isConnected):
			self.isConnected = true
			self_modulate = Color(0, 255, 66)
			break
	if(self.isConnected):
		for a in overlappingAreas:
			if(a.get_parent().isConnected):
				continue
			if(a.get_parent().isEnd):
				print("won")
				isWon.emit()
			elif(!a.get_parent().isEnd and !a.get_parent().isStart):
				a.get_parent().lightConnectedAreas()
			
func _on_area_2d_area_entered(area: Area2D) -> void:
	if(clicked):
		lightConnectedAreas()
		
func _on_area_2d_area_exited(area: Area2D) -> void:
	if(clicked):
		self_modulate = Color(0, 0, 0)
		var skip = []
		findStart(area, skip)

func findStart(area:Area2D, skip:Array)-> int:
	if(area.get_parent().isStart):
		return 1
	var overlappingAreas = area.get_overlapping_areas()
	for path in overlappingAreas:
		var goNext = false
		for s in skip:
			if(path == s):
				goNext = true
				break
		if(goNext):
			continue
		skip.append(area)
		var connectedtoStart = area.get_parent().findStart(path, skip)
		if(connectedtoStart == 1):
			return connectedtoStart
	self.isConnected = false
	self.modulate = Color(0, 0, 0)
	return 0
