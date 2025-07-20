extends Node

var PlayerHealth = 100
var Food = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if PlayerHealth == 0:
		get_tree().quit()
