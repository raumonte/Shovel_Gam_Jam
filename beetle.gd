extends CharacterBody2D

@onready var neutral: Sprite2D = $Neutral
@onready var aggro: Sprite2D = $Aggro
@onready var beetle_collision: CollisionShape2D = $"Beetle Collision"
@onready var hitbox: Area2D = $Hitbox

const Speed = 100
var OriginPoint = get_position()
var direction = 1


func _process(delta: float) -> void:
	var CurrentPosition = get_position_delta()
	
	if CurrentPosition > (OriginPoint + Vector2(200,0)):
		direction = -1
		neutral.flip_h = true
	if CurrentPosition < (OriginPoint - Vector2(200,0)):
		direction = 1
		neutral.flip_h = false
	
	position.x += direction * Speed * delta
