extends Node2D

func _ready():
	print("Pipe manager is ready")

func add_pipe(pipe_scene: PackedScene, position: Vector2):
	var pipe = pipe_scene.instantiate()  # Create a new pipe instance
	pipe.position = position  # Set its position
	add_child(pipe)  # Add it to this Node2D
