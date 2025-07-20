extends Node
@onready var player: CharacterBody2D = $Player
@onready var food_source: StaticBody2D = $Food_Source
@onready var food: Area2D = $Food_Source/Food
@onready var player_hud: Control = $"Player/Camera2D/Player HUD"
@onready var damaged_cooldown: Timer = $Player/DamagedCooldown
@onready var hitbox: Area2D = $Hitbox

var BeetleOriginPoint = 0
var PlayerObtainedFoodSource = false


func _on_damaged_cooldown_timeout() -> void:
	player.JustDamaged = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerObtainedFoodSource = false
	hitbox.Damage = 100
	

func _process(delta: float) -> void:
	if player.JustDamaged == true and damaged_cooldown.is_stopped():
		damaged_cooldown.start()
	
	if food.is_in_range == true and food.is_grabbed == false and Input.is_action_just_pressed("Interact"):
		food.is_grabbed = true
	if food.is_grabbed == true and PlayerObtainedFoodSource == false:
		player.health_manager.Food = player.health_manager.Food + 1
		PlayerObtainedFoodSource = true
	
	player_hud.HealthBarValue = player.health_manager.PlayerHealth
	player_hud.StaminaBarValue = player.Stamina
	
	if player.health_manager.PlayerHealth < 0.1:
		get_parent().get_node("CanvasLayer/Death_Screen").is_player_dead = true
	
