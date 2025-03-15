extends CharacterBody2D


class_name Player

@export var SPEED = 200.0

@onready var sprite = $Sprite2D


func _physics_process(delta: float) -> void:
	processInput(delta)
	move_and_slide()
	changeAnimation()
	
	
func processInput(delta):
	var xDirection := Input.get_axis("moveLeft", "moveRight");
	var yDirection := Input.get_axis("moveUp", "moveDown");
	if xDirection != 0:
		sprite.flip_h = xDirection == -1
	if yDirection != 0:
		sprite.flip_v = yDirection == -1
	if yDirection:
		velocity.y = yDirection * SPEED 
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	if xDirection:
		velocity.x = xDirection * SPEED 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
func changeAnimation():
	pass
