extends Area2D

var Damage = 100
var Hit_Player = false
signal Hit


func _on_body_entered(CharacterBody2D) -> void:
	Hit_Player = true
	emit_signal("Hit")
	print("You took Damage!")


func _on_body_exited(body: Node2D) -> void:
	Hit_Player = false
