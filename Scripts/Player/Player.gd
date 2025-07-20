extends CharacterBody2D

const Name = "Player"
const SPEED = 150.0
const JUMP_VELOCITY = -350.0
var RunSpeedincrease = 1.75
var MaxStamina = 5.00
var can_RegenStamina = false
var StaminaRechargeRate = 2
var Stamina = 5
var Knockback_Direction
var Knockback
var direction
var Knockback_Landed = true
var JustDamaged = false

@onready var health_manager: Node = %HealthManager
@onready var player_sprite: AnimatedSprite2D = $"Player Sprite"
@onready var player_collision: CollisionShape2D = $"Player Collision"
@onready var health_txt: Label = $HealthTxt
@onready var stamina_txt: Label = $StaminaTxt
@onready var food_txt: Label = $FoodTxt
@onready var knockback_timer: Timer = $Knockback_Timer


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("ui_left", "ui_right")
	
	#Converts the Stamina value into 2 decimal places
	#var StaminaUsed = snapped(Stamina, 0.01)
	
	#Depletes Stamina Resource and toggles Regen State
	if direction and Input.is_action_pressed("Ability_1") and Stamina > 0:
		Stamina -= (2 * delta)
		can_RegenStamina = false
	elif direction and Input.is_action_pressed("Ability_1") and Stamina < 0:
		can_RegenStamina = false
	else:
		can_RegenStamina = true
		
	if can_RegenStamina == true:
		if Stamina < 5:
			Stamina += (StaminaRechargeRate * delta)
		elif Stamina > 5:
			Stamina = 5
	
	#prevent negatives from appearing in the debug text
	#if Stamina < 0.25:
		#StaminaUsed = 0
	
	#Display Text above the player
	#health_txt.text = "Health: " + str(health_manager.PlayerHealth)
	#stamina_txt.text = "Stamina: " + str(StaminaUsed) + "/ " + str(MaxStamina)
	if Knockback_Landed == false and is_on_floor():
		Knockback_Landed = true
	
	#Flip the sprite
	if direction > 0:
		player_sprite.flip_h = false
	elif direction < 0:
			player_sprite.flip_h = true
	
	food_txt.text = "Food: " + str(health_manager.Food)
	
	#Play Animations
	if is_on_floor():
		if direction == 0:
			player_sprite.play("Idle")
		elif direction != 0 and Input.is_action_pressed("Ability_1") and Stamina > 0:
			player_sprite.play("Run")
		elif direction != 0:
			player_sprite.play("Walk")
	else:
		player_sprite.play("Jump")
	
	if direction and Input.is_action_pressed("Ability_1") and Stamina > 0 and Knockback_Landed == true:
		velocity.x = direction * SPEED * RunSpeedincrease
	elif direction and Knockback_Landed == true:
		velocity.x = direction * SPEED
	elif Knockback_Landed == true:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Knockback == true:
		velocity.y = JUMP_VELOCITY * 0.75
		velocity.x = Knockback_Direction * 400
		Knockback_Landed = false
		Knockback = false
		
	move_and_slide()


func _on_beetle_attacked() -> void:
	var beetle_direction = get_parent().get_node("Beetle").direction
	Knockback_Direction = beetle_direction
	direction = Knockback_Direction * -1
	Knockback = true


func _on_hitbox_hit() -> void:
	var hitbox_damage = get_parent().get_node("Hitbox").Damage
	if JustDamaged == false:
		health_manager.PlayerHealth = health_manager.PlayerHealth - hitbox_damage
		JustDamaged = true
