extends Sprite2D

signal lose
signal win

@onready var mazePlayer = $MazePlayer

func onMinigameStart():
	mazePlayer.set_physics_process(true)
	mazePlayer.position = Vector2(-320, -50)
	mazePlayer.velocity = Vector2(0, 0)

func onBodyTouchedWall(body: Node2D) -> void:
	if body.name == "MazePlayer":
		lose.emit()
		mazePlayer.set_physics_process(false)
		mazePlayer.position = Vector2(-320, -50)
		mazePlayer.velocity = Vector2(0, 0)

func _onWinArea2DBodyEntered(body: Node2D) -> void:
	if body.name == "MazePlayer":
		win.emit()
		mazePlayer.set_physics_process(false)
		mazePlayer.position = Vector2(-320, -50)
		mazePlayer.velocity = Vector2(0, 0)
