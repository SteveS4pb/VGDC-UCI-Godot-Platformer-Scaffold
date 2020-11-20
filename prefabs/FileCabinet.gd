extends StaticBody2D


func _on_NearFileCabinet_body_entered(body):
# Detects if a body in group "player"
# If true, changes near_file_cabinet to true to run MinigamePlayer's open_file() method

	if body.is_in_group("player"):
		body.near_file_cabinet = true


func _on_NearFileCabinet_body_exited(body):
# Detects if a body in group "player"
# If true, changes near_file_cabinet to false to stop MinigamePlayer's open_file() method

	if body.is_in_group("player"):
		body.near_file_cabinet = false


#static func open():
#	var shelf_num = 0
#	if shelf_num == 0:
#		$Sprite.play("open_top")
#	elif shelf_num == 1:
#		$Sprite.play("open_middle")
#	elif shelf_num == 2:
#		$Sprite.play("open_bottom")
