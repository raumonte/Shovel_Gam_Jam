extends Node2D

signal Hit
@onready var hitbox: Area2D = $CharacterBody2D/Hitbox


var jumpDelay = 3
var jumpTime = -1

var originPos
var currentPos
var jumpPos
var positionDiff
var originRot

var jumpUpVector
var jumpDownVector

var jumpSpeed = 150
var jumpSpeedMult = 1
var isJumpingUp = false
var isJumpingDown = false


func _ready() -> void:
	originPos = global_position
	jumpPos = (-70)
	
func _process(delta: float) -> void:
	if is_visible_in_tree() == true:
		currentPos = global_position
		jumpUpVector = Vector2(0, (-jumpSpeed * jumpSpeedMult * delta))
		jumpDownVector = Vector2(0, jumpSpeed * delta)
		jumpTime -= delta
		
		
		if !isJumpingUp && !isJumpingDown:
			jump()
			
		#Signals Player Damage
		for body in hitbox.get_overlapping_bodies():
			if body.get("Name") == "Player":
				emit_signal("Hit")
				print("attacked")
		
		jumpAnim()
	
func jump() -> void:
	if jumpTime < 0:
		isJumpingUp = true
		jumpTime = jumpDelay
	

func jumpAnim() -> void:	
	if isJumpingUp:
		translate(jumpUpVector)
	elif isJumpingDown:
		translate(jumpDownVector)
	
	if isJumpingUp && currentPos.y > jumpPos:
		rotation = 0
		isJumpingUp = true
		isJumpingDown = false
	elif isJumpingUp && currentPos.y < originPos.y:
		rotation = deg_to_rad(180)
		isJumpingDown = true
		isJumpingUp = false
	elif (isJumpingDown || isJumpingUp) && currentPos.y >= originPos.y:
		isJumpingDown = false
		isJumpingUp = false

func calculateDifferential() -> void:
	jumpSpeedMult = (0-jumpPos)/(0-currentPos.y)
