extends Node

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../Control/MusicStreamPlayer/AudioStreamPlayer2D"
@onready var timer: Timer = $"../Timer"
@onready var timer_2: Timer = $"../Timer2"


func _ready() -> void:
	if Musicloop.Musictracker == 0:
		audio_stream_player_2d.play()
	else: audio_stream_player_2d.play(Musicloop.Musictracker)

#Sends player to the game scene
func _on_play_pressed() -> void:
	update_Musictracker()
	audio_stream_player_2d.play()
	timer.start()
	

func _on_options_pressed() -> void:
	pass # Replace with function body.

func _on_quit_pressed() -> void:
	get_tree().quit()

func update_Musictracker():
	Musicloop.Musictracker = audio_stream_player_2d.get_playback_position()


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/Game.tscn")
