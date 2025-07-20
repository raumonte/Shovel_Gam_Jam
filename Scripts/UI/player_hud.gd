extends Control


@onready var health: ProgressBar = $Sprite2D/HBoxContainer/Health
@onready var stamina: ProgressBar = $Sprite2D/HBoxContainer2/Stamina

var HealthBarValue = 100
var StaminaBarValue = 5

func _process(delta: float) -> void:
	health.value = HealthBarValue
	stamina.value = StaminaBarValue
