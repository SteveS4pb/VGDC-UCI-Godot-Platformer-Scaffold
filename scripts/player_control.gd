extends KinematicBody2D

export (int) var speed = 100

var velocity = Vector2()

func _physics_process(delta):
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
