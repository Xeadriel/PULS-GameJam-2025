extends AnimatedSprite2D

var direction = Vector2.UP

const SPEED = 300

func _physics_process(delta):
	translate(direction*SPEED*delta)	

# when bullet leaves the play area
func _onHitboxAreaExited(area: Area2D) -> void:
	if area.name == "PlayArea":
		queue_free()

func _onHitboxAreaEntered(area: Area2D) -> void:
	var parent = area.get_parent()
	
	if parent is EnemyShip:
		parent.getHit()
		queue_free()
