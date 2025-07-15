extends CharacterBody2D

@onready var neutral: Sprite2D = $Neutral
@onready var aggro: Sprite2D = $Aggro
@onready var beetle_collision: CollisionShape2D = $"Beetle Collision"
@onready var hitbox: Area2D = $Hitbox
@onready var move_left_timer: Timer = $"Move Left Timer"
@onready var move_right_timer: Timer = $"Move Right Timer"




func _on_move_right_timer_timeout() -> void:
	move_left_timer.start()
	global_position + Vector2(20,0)
	
func _on_move_left_timer_timeout() -> void:
	move_right_timer.start()
	global_position + Vector2(-20,0)
