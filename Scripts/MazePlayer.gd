extends CharacterBody2D

@export var SPEED = 15

func _ready():
	set_physics_process(false)

func _physics_process(delta: float) -> void:
	processInput(delta)
	move_and_slide()

func processInput(delta):
	var xDirection := Input.get_axis("moveLeft", "moveRight");
	var yDirection := Input.get_axis("moveUp", "moveDown");
	
	var direction = Vector2(xDirection, yDirection)

	velocity += direction.normalized() * SPEED
	velocity = velocity.clamp(Vector2(-SPEED, -SPEED), Vector2(SPEED, SPEED))
	
	if not xDirection:
		velocity.x = move_toward(velocity.x, 0, SPEED/20)
	if not yDirection:
		velocity.y = move_toward(velocity.y, 0, SPEED/20)
