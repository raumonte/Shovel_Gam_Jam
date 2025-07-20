extends Node
@onready var player: CharacterBody2D = $Player
@onready var food_source: StaticBody2D = $Food_Source
@onready var food: Area2D = $Food_Source/Food
@onready var player_hud: Control = $"Player/Camera2D/Player HUD"
@onready var damaged_cooldown: Timer = $Player/DamagedCooldown

var BeetleOriginPoint = 0
var PlayerObtainedFoodSource = false
var JustDamaged = false

func _on_damaged_cooldown_timeout() -> void:
	JustDamaged = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerObtainedFoodSource = false

func _process(delta: float) -> void:
	
	if food.is_in_range == true and food.is_grabbed == false and Input.is_action_just_pressed("Interact"):
		food.is_grabbed = true
	if food.is_grabbed == true and PlayerObtainedFoodSource == false:
		player.health_manager.Food = player.health_manager.Food + 1
		PlayerObtainedFoodSource = true
	
	player_hud.HealthBarValue = player.health_manager.PlayerHealth
	player_hud.StaminaBarValue = player.Stamina
	
	#print("Player Hit? " + str(beetle.hitbox.Hit_Player))
	#print("JustDamaged? " + str(JustDamaged))
