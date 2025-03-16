extends StaticBody2D
class_name InteractibleObject

var isInteractible = false
@export var minDistance := 100.0;

@onready var interactLabel = $InteractLabel
@onready var destroyLabel = $DestroyLabel
@onready var animatedSprite = $AnimatedSprite2D
@export var player: Player = null


signal interact
signal destroy

func _ready() -> void:
	interactLabel.hide()
	destroyLabel.hide()
	
	interactLabel.text = "Press " + InputMap.action_get_events("interact")[0].as_text()[0] + " to interact"
	destroyLabel.text = "Press " + InputMap.action_get_events("destroy")[0].as_text()[0] + " to break it"

func _process(delta: float) -> void:
	var distance := global_position.distance_to(player.global_position)
	handleLabel(distance)
	if(isInteractible && Input.is_action_just_pressed("interact")):
		interact.emit()
	if(isInteractible && Input.is_action_just_pressed("destroy")):
		destroy.emit()

func handleLabel(distance):
	if(distance < minDistance):
		isInteractible = true
	else:
		isInteractible = false
	if(isInteractible):
		interactLabel.show()
		destroyLabel.show()
	else:
		interactLabel.hide()
		destroyLabel.hide()
