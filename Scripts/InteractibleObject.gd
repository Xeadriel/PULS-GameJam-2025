extends StaticBody2D
class_name InteractibleObject

var isInteractible = false
@export var minDistance := 100.0;

@onready var eLabel = $PressELabel
@export var player: Player = null

signal interact

func _ready() -> void:
	eLabel.hide();

func _process(delta: float) -> void:
	var distance := global_position.distance_to(player.global_position)
	handleLabel(distance)
	if(isInteractible && Input.is_action_just_pressed("interact")):
		interact.emit()

func handleLabel(distance):
	print(distance)
	if(distance < minDistance):
		isInteractible = true
	else:
		isInteractible = false
	if(isInteractible):
		eLabel.show()
	else:
		eLabel.hide()
