extends Control
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var panel_container_2: PanelContainer = $PanelContainer2
@onready var retry: Button = $PanelContainer/VBoxContainer/Retry
@onready var main_menu: Button = $PanelContainer/VBoxContainer/MainMenu
@onready var quit: Button = $PanelContainer/VBoxContainer/Quit
@onready var label: Label = $Label

var is_player_dead = false
var is_menu_open = false

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
	get_tree().change_scene_to_file("res://Scenes/Levels/Game.tscn")
func _on_main_menu_pressed() -> void:
	is_player_dead = false
	get_tree().change_scene_to_file("res://Scenes/Levels/main_menu.tscn")
func _on_quit_pressed():
	get_tree().quit()
