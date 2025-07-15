extends Area2D


var Damage = 5


func _on_body_entered(body: Node2D) -> void:
	print("You took Damage!")
