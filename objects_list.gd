extends Node2D
class_name objectsList

signal stacktop(top : int)
signal items(amount : int)

func getTopObject() -> int:
	var top : int = 480
	for child in get_children():
		if child is RigidBody2D:
			if child.global_position.y < top && child.angular_velocity != 0:
				top = child.global_position.y
	emit_signal("stacktop", top)
	getItemAmount()
	return top

func getItemAmount() -> void:
	var amount : int = get_child_count()
	emit_signal("items", amount)
	
