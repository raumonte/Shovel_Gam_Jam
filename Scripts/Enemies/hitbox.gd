extends Area2D

var Damage = 100
var Hit_Player = false

func _on_body_entered(_body: Node2D) -> void:
	Hit_Player = true
	print("You took Damage!")


func _on_body_exited(body: Node2D) -> void:
	Hit_Player = false
