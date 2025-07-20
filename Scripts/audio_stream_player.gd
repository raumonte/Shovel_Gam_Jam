extends AudioStreamPlayer

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	if Musicloop.Musictracker == 0:
		audio_stream_player_2d.play()
	else: audio_stream_player_2d.play(Musicloop.Musictracker)
