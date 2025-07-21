extends CharacterBody2D


var BeetleCurrentPos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		BeetleCurrentPos = global_position
