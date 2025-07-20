extends Node

@onready var level_1: Node2D = $Level1
@onready var level_2: Node2D = $Level2
@onready var level_3: Node2D = $Level3
@onready var level_4: Node2D = $Level4
@onready var level_5: Node2D = $Level5

#Toggles enemy visibilty based on if the level is visible
func _process(delta: float) -> void:
	if level_1.is_visible_in_tree() == false:
		level_1.antlion_2.hide()
		level_1.fish_4.hide()
		level_1.fish_8.hide()
	else:
		level_1.antlion_2.show()
		level_1.fish_4.show()
		level_1.fish_8.show()

	if level_2.is_visible_in_tree() == false:
		level_2.antlion.hide()
		level_2.antlion_4.hide()
		level_2.antlion_6.hide()
		level_2.fish.hide()
		level_2.fish_5.hide()
	else:
		level_2.antlion.show()
		level_2.antlion_4.show()
		level_2.antlion_6.show()
		level_2.fish.show()
		level_2.fish_5.show()
	
	if level_3.is_visible_in_tree() == false:
		level_3.antlion_3.hide()
		level_3.antlion_5.hide()
		level_3.fish_2.hide()
		level_3.fish_6.hide()
	else:
		level_3.antlion_3.show()
		level_3.antlion_5.show()
		level_3.fish_2.show()
		level_3.fish_6.show()
	
	if level_4.is_visible_in_tree() ==false:
		level_4.antlion_7.hide()
		level_4.fish_3.hide()
		level_4.fish_7.hide()
		level_4.beetle.hide()
	else:
		level_4.antlion_7.show()
		level_4.fish_3.show()
		level_4.fish_7.show()
		level_4.beetle.show()
		
	if level_5.is_visible_in_tree() ==false:
		level_5.beetle_3.hide()
	else:
		level_5.beetle_3.show()
