extends Sprite2D
class_name EnemyShip

const SPEED = 100
var hp = 1

signal escaped
signal died

func _physics_process(delta):
	translate(Vector2.LEFT*SPEED*delta)

func _onExitingPlayArea(area: Area2D) -> void:
	if area.name == "PlayArea" and hp > 0:
		escaped.emit()
		died.emit()
		queue_free()

func getHit():
	hp -= 1
	if hp <= 0:
		died.emit()
		queue_free()
		return
