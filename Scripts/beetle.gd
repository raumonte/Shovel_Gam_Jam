extends CharacterBody2D

@onready var neutral: Sprite2D = $Neutral
@onready var aggro: Sprite2D = $Aggro
@onready var beetle_collision: CollisionShape2D = $"Beetle Collision"
@onready var hitbox: Area2D = $Hitbox
@onready var label: Label = $Label
@onready var scene_manager: Node = %SceneManager



const Speed = 100
var direction = 1


func _process(delta: float) -> void:
	var CurrentPosition = get_position_delta()
	
	if CurrentPosition > (scene_manager.BeetleOriginPoint + Vector2(100,0)):
		direction = -1
		neutral.flip_h = true
	if CurrentPosition < (scene_manager.BeetleOriginPoint - Vector2(100,0)):
		direction = 1
		neutral.flip_h = false
		
		label.text = "Origin Point: " + str(scene_manager.BeetleOriginPoint)
	
	position.x += direction * Speed * delta
