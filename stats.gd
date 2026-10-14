extends Label

var items : int = 0
var stack_top : int = 0




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setScore()


func _on_objects_list_stacktop(top: int) -> void:
	if top > 0:
		stack_top = 480 - top
	else:
		stack_top = (top - 480) * -1
	setScore()


func _on_objects_list_items(amount: int) -> void:
	items = amount
	setScore()

func setScore():
	text = "Objects: %d\nHeight: %d" % [items, stack_top]
