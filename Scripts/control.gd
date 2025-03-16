extends TextureButton

var rotation_angle = 0
signal newConnection()

func _on_pressed():
	rotation_angle += 90
	if rotation_angle >= 360:
		rotation_angle = 0
	rotation_degrees = rotation_angle


func _on_area_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
