extends KinematicBody2D

export (int) var speed = 100
#var file_cabinet = load("res://prefabs/FileCabinet.gd")
var velocity = Vector2()
#var near_file_cabinet = false

func _physics_process(delta):
# Move MinigamePlayer horizontally if a key in 'ad' was pressed
#
# Changes MinigamePlayer's sprite from default to run if the MinigamePlayer is pressing 'ad'
# MinigamePlayer's sprite from run to default if the MinigamePlayer is not pressing 'ad'
#	open_file()
	
	velocity = Vector2()
	velocity.x += Input.get_action_strength("right")
	velocity.x -= Input.get_action_strength("left")
	
	velocity.x *= speed
	
	if (velocity.x == 0):
		$Sprite.play("default")
	else:
		$Sprite.play("run")
	
	var _i = move_and_slide(velocity)


#func open_file():
## If near_file_cabinet, opens FileCabinet if player presses 'e'
#	if near_file_cabinet:
#		if Input.is_action_pressed("interact"):
#			FileCabinet.call("open", args)
