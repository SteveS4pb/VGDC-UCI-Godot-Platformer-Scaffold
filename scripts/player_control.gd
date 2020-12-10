extends KinematicBody2D

export (int) var speed = 100
var velocity = Vector2()
var changing_rooms = false
var to_terminal = ''
var to_minigame = ''
var walking = false


func _physics_process(delta):
# Move Player vertically or horizontally if a key in 'wasd' was pressed
	velocity = Vector2()
	velocity.x += Input.get_action_strength("right")
	velocity.x -= Input.get_action_strength("left")
	velocity.y -= Input.get_action_strength("up")
	velocity.y += Input.get_action_strength("down")
	
	velocity *= speed
	
	if (velocity.x == 0) and (velocity.y == 0):
		walking = false
	else:
		walking = true
	
	var _i = move_and_slide(velocity)
	
	if changing_rooms:
		change_rooms()


func _process(delta):
# Changes Player's sprite from idle to walk if the Player is pressing 'wasd'
# Changes Player's sprite from walk to idle if the Player is not pressing 'wasd'
	print(get_node("Sprite/Player Animator").current_animation)
	if walking and get_node("Sprite/Player Animator").current_animation != "walk":
		$Sprite.play("walk")
	elif not walking:
		$Sprite.play("idle")


func change_rooms():
	changing_rooms = false
	if to_terminal == 'prefrontal_cortex':
		to_terminal = ''
		get_tree().change_scene("res://scenes/Frontal_Lobe.tscn")
	elif to_terminal == 'temporal_lobe':
		to_terminal = ''
		get_tree().change_scene("res://scenes/Temporal_Lobe.tscn")
	elif to_terminal == 'brain_stem':
		to_terminal = ''
		get_tree().change_scene("res://scenes/brain_stem.tscn")
	elif to_minigame == 'minigame_calc_files':
		to_minigame = ''
		get_tree().change_scene("res://scenes/Minigame_Calc_Files.tscn")
