extends Area2D

var FishDamage = 100
var BeetleDamage = 50
var AntlionDamage = 100
var KillboxDamage = 100
var Hit_Player = false
signal Hit


func _on_body_entered(body: Node2D) -> void:
		emit_signal("Hit")
		Hit_Player = true
		print("hit")

func _on_body_exited(body: Node2D) -> void:
	Hit_Player = false
