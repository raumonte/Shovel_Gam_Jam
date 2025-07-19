extends Node
@onready var beetle: CharacterBody2D = $Beetle

var BeetleOriginPoint = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BeetleOriginPoint = beetle.get_global_position()
