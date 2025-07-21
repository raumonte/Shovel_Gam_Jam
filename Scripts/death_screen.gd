extends Control
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var panel_container_2: PanelContainer = $PanelContainer2
@onready var retry: Button = $PanelContainer/VBoxContainer/Retry
@onready var main_menu: Button = $PanelContainer/VBoxContainer/MainMenu
@onready var quit: Button = $PanelContainer/VBoxContainer/Quit
@onready var label: Label = $Label
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"Death Screen Audio Manager/AudioStreamPlayer2D"
@onready var audio_stream_player_2d_2: AudioStreamPlayer2D = $"Death Screen Audio Manager/AudioStreamPlayer2D2"
@onready var retry_timer: Timer = $Retry
@onready var main: Timer = $Main



var is_player_dead = false
var is_menu_open = false

func _ready() -> void:
	audio_stream_player_2d.play(Musicloop.Musictracker)

func _process(delta: float) -> void:
	if is_player_dead == true and is_menu_open == false:
		panel_container_2.show()
		show()
		is_menu_open = true
		animation_player.play("blur")
		panel_container_2.set_visibility_layer_bit(1, true)
		retry.disabled = false
		main_menu.disabled = false
		quit.disabled = false

func _on_retry_pressed():
	is_player_dead = false
	audio_stream_player_2d_2.play()
	retry_timer.start()
func _on_retrytimer_timeout() -> void:
	Musicloop.Musictracker = audio_stream_player_2d.get_playback_position()
	get_tree().change_scene_to_file("res://Scenes/Levels/Game.tscn")
	
func _on_main_menu_pressed() -> void:
	is_player_dead = false
	audio_stream_player_2d_2.play()
	main.start()
func _on_main_timeout() -> void:
	Musicloop.Musictracker = audio_stream_player_2d.get_playback_position()
	get_tree().change_scene_to_file("res://Scenes/Levels/main_menu.tscn")

func _on_quit_pressed():
	get_tree().quit()
