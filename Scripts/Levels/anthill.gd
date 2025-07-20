extends Area2D

@onready var label: Label = $Label
@onready var health_manager: Node = %HealthManager

var is_deposited = false
var is_in_range = false
var PlayerHasFood = true
var FoodDeposited
var FoodAmountDeposited = 0
var LevelCount = 1

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Interact") and PlayerHasFood == true and is_in_range == true:
		FoodDeposited = true
		LevelCount += 1
		
	if PlayerHasFood == true and is_in_range == true:
		label.text = "F to deposit"
	else:
		label.text = ""
		
		#if LevelCount == 2
			#show Level2 Enemies
		#elif LevelCount == 3
			#show Level3 Enemies
		#elif LevelCount == 4
			#show Level4 Enemies
		#elif LevelCount == 5
			#show Level5 Enemies 
		
#Displays helpful tip for interacting with the food
func _on_body_entered(body: Node2D) -> void:
	is_in_range = true
	print ("in range")

func _on_body_exited(body: Node2D) -> void:
	is_in_range = false
	label.text = ""
	print("out of range")

func _on_player_i_has_food() -> void:
	PlayerHasFood = true
