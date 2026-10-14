extends Area2D

@onready var label: Label = $"../Camera2D/Label"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("object"):
		label.visible = true
		get_tree().paused = true
