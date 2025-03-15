extends StaticBody2D


var isInteractible = false
@export var minDistance := 100.0;

@onready var eLabel = $PressELabel
@export var player: Player = null

func _ready() -> void:
	eLabel.hide();

func _process(delta: float) -> void:
	var distance := global_position.distance_to(player.global_position)
	handleLabel(distance)
	if(isInteractible && Input.is_action_just_pressed("interact")):
		pass

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
