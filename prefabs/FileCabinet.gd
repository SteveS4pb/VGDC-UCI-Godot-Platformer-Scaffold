extends StaticBody2D

var near_file_cabinet = false
var shelf_num = 0


func _on_NearFileCabinet_body_entered(body):
# Detects if a body in group "player"
# If true, changes near_file_cabinet to true to run MinigamePlayer's open_file() method

	if body.is_in_group("player"):
		#body.near_file_cabinet = true
		near_file_cabinet = true


func _on_NearFileCabinet_body_exited(body):
# Detects if a body in group "player"
# If true, changes near_file_cabinet to false to stop MinigamePlayer's open_file() method

	if body.is_in_group("player"):
		#body.near_file_cabinet = false
		near_file_cabinet = false

func _ready():
	set_process_input(true)

func _input(event):
	if Input.is_action_pressed("interact") and near_file_cabinet:
		if shelf_num == 0:
			$Sprite.play("open_top")
			shelf_num += 1
		elif shelf_num == 1:
			$Sprite.play("open_middle")
			shelf_num += 1
		elif shelf_num == 2:
			$Sprite.play("open_bottom")
			shelf_num = 0
