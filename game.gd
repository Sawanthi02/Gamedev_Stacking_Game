extends Node2D

@export var camera: Camera2D

func _on_objects_list_stacktop(top: int) -> void:
	print(camera.global_position)
	print(top)
	if camera.global_position.y > top - 480 && top < 480:
		camera.global_position.y = top - 120
