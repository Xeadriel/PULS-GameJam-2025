extends TextureButton

var rotation_angle = 0

func _on_pressed() -> void:
	rotation_angle += 90
	if rotation_angle >= 360:
		rotation_angle = 0
	rotation_degrees = rotation_angle
