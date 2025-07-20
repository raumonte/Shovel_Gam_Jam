extends Node

@onready var beetle: CharacterBody2D = $Beetle
@onready var player: CharacterBody2D = $Player
@onready var food_source: Area2D = $Food_Source
@onready var damaged_cooldown: Timer = $Player/DamagedCooldown
@onready var player_hud: Control = $"Player/Camera2D/Player HUD"

var BeetleOriginPoint = 0
var PlayerObtainedFoodSource = false


func _on_damaged_cooldown_timeout() -> void:
	player.JustDamaged = false


func _ready() -> void:
	PlayerObtainedFoodSource = false
	BeetleOriginPoint = beetle.get_global_position()

func _process(delta: float) -> void:
	if player.JustDamaged == true and damaged_cooldown.is_stopped():
		damaged_cooldown.start()
	
	#Ensures player cannot interact with the food source more than once
	if food_source.is_in_range == true and food_source.is_grabbed == false and Input.is_action_just_pressed("Interact"):
		food_source.is_grabbed = true
	if food_source.is_grabbed == true and PlayerObtainedFoodSource == false:
		player.health_manager.Food = player.health_manager.Food + 1
		PlayerObtainedFoodSource = true
	
	#Updating HUD
	player_hud.HealthBarValue = player.health_manager.PlayerHealth
	player_hud.StaminaBarValue = player.Stamina
	
	if player.health_manager.PlayerHealth < 0.1:
		get_parent().get_node("SceneManager(Game)/Player/Camera2D/Death_Screen").is_player_dead = true
	#print("Player Hit? " + str(beetle.hitbox.Hit_Player))
	#print("JustDamaged? " + str(JustDamaged))
