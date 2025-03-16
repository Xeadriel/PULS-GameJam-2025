extends Node2D

signal goBack()
signal attach(freePos, partner)

@onready var shortest = 10000;

func _on_box_shape_piece_drop(selectedMarkers: Variant) -> void:
	var distance = self.global_position.distance_to(selectedMarkers.global_position)
	print(distance)
	if(distance < 100):
		shortest = distance
		selectedMarkers.global_position = global_position
		selectedMarkers.set_collision_layer_value(1, true)
		
