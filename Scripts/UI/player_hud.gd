extends Control


@onready var health: ProgressBar = $Sprite2D/HBoxContainer/Health
@onready var stamina: ProgressBar = $Sprite2D/HBoxContainer2/Stamina
@onready var label: Label = $Label
@onready var sprite_2d_2: Sprite2D = $Sprite2D2

var HealthBarValue = 100
var StaminaBarValue = 5
var has_food = false

func _process(delta: float) -> void:
	health.value = HealthBarValue
	stamina.value = StaminaBarValue
	if has_food == true:
		sprite_2d_2.show()
	else:
		sprite_2d_2.hide()


func _on_player_i_has_food() -> void:
	has_food = true
