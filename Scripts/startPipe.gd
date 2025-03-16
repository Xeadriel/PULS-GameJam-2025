extends Control

@onready var isConnected = true
@onready var isEnd = false
@onready var pipeSprite = $Start/Sprite2D
@onready var isStart = true

func _ready() -> void:
	pipeSprite.modulate = Color(0, 255, 66)

func _on_start_area_entered(area: Area2D) -> void:
	if(isConnected):
		area.get_parent().isConnected = true
		area.get_parent().modulate = Color(0, 255, 66)

func findStart(area:Area2D, skip:Array)-> int:
	return 1
