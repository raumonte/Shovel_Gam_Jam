extends Node2D

signal Hit
@onready var hitbox: Area2D = $StaticBody2D/Hitbox


@onready var raycast2d: RayCast2D = $StaticBody2D/RayCast2D
var originPos
var canAttack = true
var resetTime = 2

func _ready() -> void:
		originPos = global_position

func _process(delta: float) -> void:
	if resetTime > 0 && canAttack == false:
		resetTime -= delta
	
	for body in hitbox.get_overlapping_bodies():
		if body.get("Name") == "Player":
			emit_signal("Hit")
			print("attacked")
	
	attackReset()

func _physics_process(delta: float) -> void:
	if raycast2d.is_colliding():
		attack()
	
func attack() -> void:
	if canAttack:
		translate(Vector2(0, -40))
		canAttack = false
		resetTime = 2
		
func attackReset() -> void:
	if resetTime <= 0 && canAttack == false:
		canAttack = true
		translate(Vector2(0, 40))
	
