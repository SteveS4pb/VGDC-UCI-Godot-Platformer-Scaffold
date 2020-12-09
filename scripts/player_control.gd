extends KinematicBody2D

export (int) var speed = 100
var velocity = Vector2()
var changing_rooms = false
var to_terminal = ''
var to_minigame = ''


func _physics_process(delta):
# Move Player vertically or horizontally if a key in 'wasd' was pressed
#
# Changes Player's sprite from default to run if the Player is pressing 'wasd'
# Changes Player's sprite from run to default if the Player is not pressing 'wasd'
	
	velocity = Vector2()
	velocity.x += Input.get_action_strength("right")
	velocity.x -= Input.get_action_strength("left")
	velocity.y -= Input.get_action_strength("up")
	velocity.y += Input.get_action_strength("down")
	
	velocity *= speed
	
	if (velocity.x == 0) and (velocity.y == 0):
		$Sprite.play("default")
	else:
		$Sprite.play("run")
	
	var _i = move_and_slide(velocity)
	
	if changing_rooms:
		change_rooms()

func change_rooms():
	changing_rooms = false
	if to_terminal == 'prefrontal_cortex':
		to_terminal = ''
		get_tree().change_scene("res://scenes/Minigame_Calc_Files.tscn")
	elif to_terminal == 'temporal_lobe':
		to_terminal = ''
		get_tree().change_scene("res://scenes/Temporal_Lobe.tscn")
	elif to_terminal == 'brain_stem':
		to_terminal = ''
		get_tree().change_scene("res://scenes/brain_stem.tscn")
	elif to_minigame == 'minigame_calc_files':
		to_minigame = ''
		get_tree().change_scene("res://scenes/Minigame_Calc_Files.tscn")
