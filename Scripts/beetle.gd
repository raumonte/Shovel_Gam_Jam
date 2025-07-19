extends CharacterBody2D

@onready var neutral: Sprite2D = $Neutral
@onready var aggro: Sprite2D = $Aggro
@onready var beetle_collision: CollisionShape2D = $"Beetle Collision"
@onready var hitbox: Area2D = $Hitbox
@onready var label: Label = $Label
@onready var scene_manager: Node = %SceneManager
@onready var node_2d: Node2D = $Node2D
@onready var ray_cast_2d: RayCast2D = $Node2D/RayCast2D

var Speed = 100
var direction = 1
var is_Attacking = false

func _process(delta: float) -> void:
	var CurrentPosition = get_position_delta()
	
	if ray_cast_2d.is_colliding() == true:
		$"Reaction Timer".start()
		is_Attacking = true
		ray_cast_2d.set_collision_mask(3)
		print(ray_cast_2d.collision_mask)
	elif $"Reaction Timer".is_stopped() and is_Attacking == true:
		Speed + 300
		$"Attack Timer".start()
		$"Attack Cooldown".start()
	elif $"Attack Timer".is_stopped() and is_Attacking == true:
		is_Attacking = false
		Speed - 300
	elif $"Attack Cooldown".is_stopped() and is_Attacking == false:
		ray_cast_2d.enabled = true
		
	if CurrentPosition > (scene_manager.BeetleOriginPoint + Vector2(100,0)) and is_Attacking == false:
		direction = -1
	elif CurrentPosition < (scene_manager.BeetleOriginPoint - Vector2(100,0)) and is_Attacking == false:
		direction = 1
		
	node_2d.scale.x = direction
	
	label.text = "Origin Point: " + str(scene_manager.BeetleOriginPoint)
	$Label2.text = "Am I attacking:" + str(is_Attacking)
	
	position.x += direction * Speed * delta
