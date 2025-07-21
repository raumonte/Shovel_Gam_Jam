extends Area2D

@onready var label: Label = $Label
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var is_grabbed = false
var is_in_range = false
var FoodRemaining = 5
var OutofFood = false

func _process(delta: float) -> void:
	if FoodRemaining == 5:
		animated_sprite_2d.play("5 Food Remaining ")
	elif FoodRemaining == 4:
		animated_sprite_2d.play("4 Food Remaining")
	elif FoodRemaining == 3:
		animated_sprite_2d.play("3 Food Remaining")
	elif FoodRemaining == 2:
		animated_sprite_2d.play("2 Food Remaining")
	elif FoodRemaining == 1:
		animated_sprite_2d.play("1 Food Remaining")
	elif FoodRemaining == 0:
		animated_sprite_2d.play("Reset")
		OutofFood = true

#Displays helpful tip for interacting with the food
func _on_body_entered(body: Node2D) -> void:
	is_in_range = true
	if is_grabbed == false and OutofFood == false:
		label.text = "F to grab"
		
	else:
		label.text = ""

func _on_body_exited(body: Node2D) -> void:
	is_in_range = false
	label.text = ""
