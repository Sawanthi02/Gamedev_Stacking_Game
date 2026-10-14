extends Node2D
class_name ObjectSpawner

var object1 = preload("res://items/Stick.tscn")
var object2 = preload("res://items/SlimeBall.tscn")
var objeect3 = preload("res://items/Honey.tscn")
var object4 = preload("res://items/IronIngot.tscn")
var object5 = preload("res://items/Feather.tscn")
var object6 = preload("res://items/Totem.tscn")


var objects : Array
func _ready() -> void:
	objects=[object1, object2, objeect3, object4, object5, object6]

@export var objectList: objectsList

var holding_object : bool = false
var current_object : RigidBody2D

func _process(delta: float) -> void:
	if holding_object:
		current_object.global_position = Vector2(get_global_mouse_position().x, objectList.getTopObject() - 400)
	else:
		var select = objects[randi() % objects.size()]
		current_object = select.instantiate()
		current_object.freeze = true
		current_object.position = Vector2(get_global_mouse_position().x, objectList.getTopObject() - 400)
		add_child(current_object)
		holding_object = true

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		holding_object = false
		current_object.freeze = false
		current_object.position.y += 50
		addToStack(current_object)
		current_object = null
		
func addToStack(new_object : RigidBody2D):
	remove_child(new_object)
	objectList.add_child(new_object)
