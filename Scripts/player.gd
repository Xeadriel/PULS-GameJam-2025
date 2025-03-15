extends CharacterBody2D

class_name Player

@export var SPEED = 200.0

@onready var animatedSprite = $AnimatedSprite2D
var lastVelY = 0


func _physics_process(delta: float) -> void:
	processInput(delta)
	move_and_slide()
	changeAnimation()
	
	
func processInput(delta):
	var xDirection := Input.get_axis("moveLeft", "moveRight");
	var yDirection := Input.get_axis("moveUp", "moveDown");
	
	if yDirection:
		velocity.y = yDirection * SPEED 
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	if xDirection:
		velocity.x = xDirection * SPEED 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	velocity = velocity.normalized() * SPEED
	
func changeAnimation():
	if velocity.y > 0:
		animatedSprite.play("front")
		lastVelY = velocity.y
	elif velocity.y < 0:
		animatedSprite.play("back")
		lastVelY = velocity.y
	
	if lastVelY > 0:
		if velocity.x < 0:
			animatedSprite.flip_h = true
		elif velocity.x > 0:
			animatedSprite.flip_h = false
	else:
		if velocity.x < 0:
			animatedSprite.flip_h = false
		elif velocity.x > 0:
			animatedSprite.flip_h = true
	
