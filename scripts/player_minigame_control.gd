extends KinematicBody2D

export (int) var speed = 100
var velocity = Vector2()
var walking = false


func _physics_process(delta):
# Move MinigamePlayer horizontally if a key in 'ad' was pressed
	velocity = Vector2()
	velocity.x += Input.get_action_strength("right")
	velocity.x -= Input.get_action_strength("left")
	
	velocity.x *= speed
	
	if (velocity.x == 0):
		walking = false
	else:
		walking = true
	
	var _i = move_and_slide(velocity)


func _process(delta):
# Changes MinigamePlayer's sprite from default to run if the MinigamePlayer is pressing 'ad'
# MinigamePlayer's sprite from run to default if the MinigamePlayer is not pressing 'ad'
	print(get_node("Sprite/Player Animator").current_animation)
	if walking and get_node("Sprite/Player Animator").current_animation != "walk":
		$Sprite.play("walk")
	elif not walking:
		$Sprite.play("idle")
