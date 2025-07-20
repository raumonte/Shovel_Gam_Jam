extends CharacterBody2D

@onready var neutral: Sprite2D = $Node2D/Neutral
@onready var beetle_collision: CollisionShape2D = $"Beetle Collision"
@onready var hitbox: Area2D = $Node2D/Hitbox
@onready var label: Label = $Label
@onready var label_2: Label = $Node2D/Label2
@onready var scene_manager_game_: Node = %"SceneManager(Game)"
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
var originposition

signal Attacked
signal Hit


func _on_reaction_timer_timeout() -> void:
	label_2.text = ""
	Speed = 300
	direction = attack_direction
	attack_timer.start()
	collision_shape_2d.set_deferred("disabled", false)
	attack_cooldown.start()

func _ready() -> void:
	originposition = global_position

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
		label_2.text = "!"
		is_Attacking = true
		attack_direction = direction
		Speed = 0
		ray_cast_2d.enabled = false
		
	for body in hitbox.get_overlapping_bodies():
		if body.get("Name") == "Player":
			emit_signal("Attacked")
			emit_signal("Hit")
			print("attacked")
			
	if CurrentPosition > (originposition + Vector2(100,0)) and is_Attacking == false:
		direction = -1
	elif CurrentPosition < (originposition - Vector2(100,0)) and is_Attacking == false:
		direction = 1
		
	node_2d.scale.x = direction
	
	#label.text = "Origin Point: " + str(scene_manager.BeetleOriginPoint)
	#$Label2.text = "Am I attacking:" + str(is_Attacking)
	
	position.x += direction * Speed * delta
