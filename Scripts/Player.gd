extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -350.0
var RunSpeed = 100.0

@onready var player_sprite: AnimatedSprite2D = $"Player Sprite"

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	#Flip the sprite
	if direction > 0:
		player_sprite.flip_h = false
	elif direction < 0:
			player_sprite.flip_h = true
	
	#Play Animations
	if is_on_floor():
		if direction == 0:
			player_sprite.play("Idle")
		elif direction != 0:
			player_sprite.play("Walk")
		elif direction != 0 and Input.is_action_pressed("Ability_1"):
			player_sprite.play("Run")
			print("Running")
	else:
		player_sprite.play("Jump")
	
	if direction:
		velocity.x = direction * SPEED
	elif direction and Input.is_action_pressed("Ability_1"):
		velocity.x = direction * SPEED + RunSpeed
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
