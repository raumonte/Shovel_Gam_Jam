extends Control
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var is_player_dead = false
var is_menu_open = false

func _process(delta: float) -> void:
	if is_player_dead == true and is_menu_open == false:
		animation_player.play("blur")
		is_menu_open = true

func _on_retry_pressed():
	is_player_dead = false
	get_tree().change_scene_to_file("res://Scenes/Levels/Game.tscn")
func _on_main_menu_pressed() -> void:
	is_player_dead = false
	get_tree().change_scene_to_file("res://Scenes/Levels/main_menu.tscn")
func _on_quit_pressed():
	get_tree().quit()
