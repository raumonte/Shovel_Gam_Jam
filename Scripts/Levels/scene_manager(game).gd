extends Node

@onready var player: CharacterBody2D = $Player
@onready var food_source: Area2D = $Food_Source
@onready var damaged_cooldown: Timer = $Player/DamagedCooldown
@onready var player_hud: Control = $"Player/Camera2D/Player HUD"
@onready var anthill: Area2D = $Anthill
@onready var enemies: Node = %Enemies
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $Player/AudioStreamPlayer/AudioStreamPlayer2D
@onready var timer: Timer = $Timer



func _on_damaged_cooldown_timeout() -> void:
	player.JustDamaged = false

func _process(delta: float) -> void:
	if player.JustDamaged == true and damaged_cooldown.is_stopped():
		damaged_cooldown.start()
	
	#Ensures player cannot interact with the food source more than once
	if food_source.is_in_range == true and food_source.is_grabbed == false and Input.is_action_just_pressed("Interact"):
		food_source.is_grabbed = true
		player.health_manager.Food = player.health_manager.Food + 1
		food_source.FoodRemaining = food_source.FoodRemaining - 1
	
	if anthill.FoodDeposited == true:
		player.health_manager.Food = 0
		anthill.PlayerHasFood = false
		player_hud.has_food = false
		anthill.FoodDeposited = false
		food_source.is_grabbed = false
		player.health_manager.PlayerHealth = 100
	
	if anthill.LevelCount == 1:
		enemies.level_1.show()
		enemies.level_2.hide()
		enemies.level_3.hide()
		enemies.level_4.hide()
		enemies.level_5.hide()
	elif anthill.LevelCount == 2:
		enemies.level_1.show()
		enemies.level_2.show()
		enemies.level_3.hide()
		enemies.level_4.hide()
		enemies.level_5.hide()
	elif anthill.LevelCount == 3:
		enemies.level_1.show()
		enemies.level_2.show()
		enemies.level_3.show()
		enemies.level_4.hide()
		enemies.level_5.hide()
	elif anthill.LevelCount == 4:
		enemies.level_1.show()
		enemies.level_2.show()
		enemies.level_3.show()
		enemies.level_4.show()
		enemies.level_5.hide()
	elif anthill.LevelCount == 5:
		enemies.level_1.show()
		enemies.level_2.show()
		enemies.level_3.show()
		enemies.level_4.show()
		enemies.level_5.show()
	elif anthill.LevelCount == 6:
		get_tree().change_scene_to_file("res://Scenes/Levels/Victory.tscn")
	
	
	#Updating HUD
	player_hud.HealthBarValue = player.health_manager.PlayerHealth
	player_hud.StaminaBarValue = player.Stamina
	player_hud.label.text = "Level: " + str(anthill.LevelCount)
	
	if player.health_manager.PlayerHealth < 0.1:
		audio_stream_player_2d.pitch_scale = 0.5
		Engine.time_scale = 0.5
		if player.is_on_floor():
			Musicloop.Musictracker = audio_stream_player_2d.get_playback_position()
			Engine.time_scale = 1
			get_tree().change_scene_to_file("res://Scenes/UI/death_screen.tscn")
	
