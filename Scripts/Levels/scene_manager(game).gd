extends Node

@onready var beetle: CharacterBody2D = $Beetle
@onready var player: CharacterBody2D = $Player
@onready var food_source: Area2D = $Food_Source
@onready var damaged_cooldown: Timer = $Player/DamagedCooldown
@onready var player_hud: Control = $"Player/Camera2D/Player HUD"

var BeetleOriginPoint = 0
var PlayerObtainedFoodSource = false
var JustDamaged = false


func _on_damaged_cooldown_timeout() -> void:
	JustDamaged = false


func _ready() -> void:
	PlayerObtainedFoodSource = false
	BeetleOriginPoint = beetle.get_global_position()
	beetle.hitbox.Damage = 50

func _process(delta: float) -> void:
	if beetle.hitbox.Hit_Player == true and JustDamaged == false:
		player.health_manager.PlayerHealth =  player.health_manager.PlayerHealth - beetle.hitbox.Damage
		JustDamaged = true
	if JustDamaged == true:
		damaged_cooldown.start()
	
	if food_source.is_in_range == true and food_source.is_grabbed == false and Input.is_action_just_pressed("Interact"):
		food_source.is_grabbed = true
	if food_source.is_grabbed == true and PlayerObtainedFoodSource == false:
		player.health_manager.Food = player.health_manager.Food + 1
		PlayerObtainedFoodSource = true
	
	player_hud.HealthBarValue = player.health_manager.PlayerHealth
	player_hud.StaminaBarValue = player.Stamina
	
	#print("Player Hit? " + str(beetle.hitbox.Hit_Player))
	#print("JustDamaged? " + str(JustDamaged))
