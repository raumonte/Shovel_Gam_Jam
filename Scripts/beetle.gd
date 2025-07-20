extends CharacterBody2D

@onready var neutral: Sprite2D = $Node2D/Neutral
@onready var beetle_collision: CollisionShape2D = $"Beetle Collision"
@onready var hitbox: Area2D = $Node2D/Hitbox
@onready var label: Label = $Label
@onready var scene_manager: Node = %SceneManager
@onready var node_2d: Node2D = $Node2D
@onready var ray_cast_2d: RayCast2D = $Node2D/RayCast2D
@onready var reaction_timer: Timer = $"Reaction Timer"
@onready var attack_timer: Timer = $"Attack Timer"
@onready var attack_cooldown: Timer = $"Attack Cooldown"
@onready var collision_shape_2d: CollisionShape2D = $Node2D/Hitbox/CollisionShape2D

var Speed = 100
var direction = 1
var is_Attacking = false
var attack_direction = 0

func _on_reaction_timer_timeout() -> void:
	Speed = 300
	direction = attack_direction
	attack_timer.start()
	collision_shape_2d.set_deferred("disabled", false)
	attack_cooldown.start()


func _on_attack_timer_timeout() -> void:
	is_Attacking = false
	Speed = 100
	collision_shape_2d.set_deferred("disabled", true)

func _on_attack_cooldown_timeout() -> void:
	ray_cast_2d.enabled = true

func _process(delta: float) -> void:
	var CurrentPosition = get_position_delta()
	
	if ray_cast_2d.is_colliding() == true:
		reaction_timer.start()
		is_Attacking = true
		attack_direction = direction
		Speed = 0
		ray_cast_2d.enabled = false
		
	if CurrentPosition > (scene_manager.BeetleOriginPoint + Vector2(100,0)) and is_Attacking == false:
		direction = -1
	elif CurrentPosition < (scene_manager.BeetleOriginPoint - Vector2(100,0)) and is_Attacking == false:
		direction = 1
		
	node_2d.scale.x = direction
	
	#label.text = "Origin Point: " + str(scene_manager.BeetleOriginPoint)
	#$Label2.text = "Am I attacking:" + str(is_Attacking)
	
	position.x += direction * Speed * delta
