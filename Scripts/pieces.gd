extends CharacterBody2D

class_name Piece

signal pieceDrop(selectedMarkers)

@export var startPos = Vector2.ZERO
@export var offset = Vector2(16, -16)

var isChosen = false

func _ready() -> void:
	global_position = startPos

func _input(event: InputEvent) -> void:
	if global_position.distance_to(get_global_mouse_position()) < 20 :
		if event is InputEventMouseButton and event.is_pressed():
			isChosen = true
	if event is InputEventMouseButton and event.is_released():
		isChosen = false
		pieceDrop.emit(self)
		
func _physics_process(delta: float) -> void:
	if isChosen:
		global_position = get_global_mouse_position()
		
func _on_marker_2d_attach(freePos: Variant, partner: Variant) -> void:
	partner.global_position = freePos.global_position

func _on_border_body_entered(body: Node2D) -> void:
	global_position = startPos
	self.set_collision_layer_value(1, false)
