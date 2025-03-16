extends Node

@export var disappearAfter = 10
var timer = 0

func _process(delta: float) -> void:
	timer += delta
	if timer >= disappearAfter:
		queue_free()
