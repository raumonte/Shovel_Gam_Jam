extends Control
@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer/AudioStreamPlayer2D
@onready var audio_stream_player_2d_2: AudioStreamPlayer2D = $AudioStreamPlayer/AudioStreamPlayer2D2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_stream_player_2d.play(Musicloop.Musictracker)	

func _on_main_menu_pressed() -> void:
	audio_stream_player_2d_2.play()
	timer.start()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_timer_timeout() -> void:
	Musicloop.Musictracker = audio_stream_player_2d.get_playback_position()
	get_tree().change_scene_to_file("res://Scenes/Levels/main_menu.tscn")
