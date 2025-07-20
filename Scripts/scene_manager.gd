extends Node
@onready var beetle: CharacterBody2D = $Beetle
@onready var player: CharacterBody2D = $Player
@onready var food_source: StaticBody2D = $Food_Source
@onready var food: Area2D = $Food_Source/Food

var BeetleOriginPoint = 0
var PlayerObtainedFoodSource = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerObtainedFoodSource = false
	BeetleOriginPoint = beetle.get_global_position()

func _process(delta: float) -> void:
	if beetle.hitbox.Hit_Player == true:
		player.health_manager.PlayerHealth =  player.health_manager.PlayerHealth - beetle.hitbox.Damage
		print("Player Health: " + str(player.health_manager.PlayerHealth))
	if food.is_in_range == true and food.is_grabbed == false and Input.is_action_just_pressed("Interact"):
		food.is_grabbed = true
	if food.is_grabbed == true and PlayerObtainedFoodSource == false:
		player.health_manager.Food = player.health_manager.Food + 1
		PlayerObtainedFoodSource = true
