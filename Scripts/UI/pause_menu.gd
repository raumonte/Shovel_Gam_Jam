extends Control

@onready var resume_button: Button = $PanelContainer/VBoxContainer/Resume
@onready var options: Button = $PanelContainer/VBoxContainer/Options
@onready var quit: Button = $PanelContainer/VBoxContainer/Quit


var is_menu_open = false

func _ready():
	$AnimationPlayer.play("RESET")

func _process(delta: float) -> void:
	if is_menu_open == true:
		resume_button.disabled = false
		options.disabled = false
		quit.disabled = false
	else:
		resume_button.disabled = true
		options.disabled = true
		quit.disabled = true
	print("Resume: " + str(resume_button.disabled))
	print("Options: " + str(options.disabled))
	print("Quit: " + str(quit.disabled))

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	is_menu_open = false

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	is_menu_open = true

func _unhandled_input(_delta):
	testEsc()

func testEsc():
	if Input.is_action_just_pressed("pause") and get_tree().paused == false and is_menu_open == false:
		pause()
	elif Input.is_action_just_pressed("pause") and get_tree().paused == true and is_menu_open == true:
		resume()

func _on_resume_pressed():
	resume()

func _on_quit_pressed():
	get_tree().quit()

func _on_options_pressed():
	pass # Replace with function body
