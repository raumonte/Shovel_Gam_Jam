extends Area2D

@onready var health_manager: Node = %HealthManager

var Damage = 50


func _on_body_entered(_body: Node2D) -> void:
	print("You took Damage!")
