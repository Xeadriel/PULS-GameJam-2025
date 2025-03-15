extends Node2D

class_name TurretBarrel

@export var level : Node = null
@export var shot : PackedScene = null
@export var SHOOTING_SPEED = 0.9
var shootTimer = 0
@onready var barrelSprite = $TurretBarrelSprite
@onready var barrelTip = $TurretBarrelSprite/Tip

func _process(delta: float) -> void:
	shootTimer += delta
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and shootTimer >= SHOOTING_SPEED:
		var direction = (get_viewport().get_mouse_position() - barrelSprite.global_position).normalized()
		direction.x = clamp(direction.x, 0, 1)
		shoot(direction)
		shootTimer = 0

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		look_at(event.position)
		rotation_degrees = clamp(rotation_degrees, -90, 90)

func shoot(direction):
	var newShot = shot.instantiate()
	newShot.name = "Bullet"
	level.get_node("Bullets").add_child(newShot)
	newShot.global_position = barrelTip.global_position
	newShot.direction = direction
