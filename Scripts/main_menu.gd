extends CanvasLayer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $Control/MusicStreamPlayer/AudioStreamPlayer2D

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/DevLevel.tscn")


func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()

func update_Musictracker():
	Global.Musictracker = main_menu_background_music.get_playback_position()
func _ready() -> void:
	if Global.Musictracker == 0:
		main_menu_background_music.play()
	else: main_menu_background_music.play(Global.Musictracker)

#Sends player to the game scene
func _on_play_pressed() -> void:
	update_MusicTracker()
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")
