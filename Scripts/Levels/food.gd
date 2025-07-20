extends Area2D

@onready var label: Label = $Label

var is_grabbed = false
var is_in_range = false

#Displays helpful tip for interacting with the food
func _on_body_entered(body: Node2D) -> void:
	is_in_range = true
	if is_grabbed == false:
		label.text = "F to grab"
		
	else:
		label.text = ""

func _on_body_exited(body: Node2D) -> void:
	is_in_range = true
	label.text = ""
