extends StaticBody2D

var near_file_cabinet = false
var shelf_num = 0
var shelf1 = [0, 0, 0]
var shelf2 = [0, 0, 0]
var shelf3 = [0, 0, 0]
var needed_files = []
var found_file = 0


func _on_NearFileCabinet_body_entered(body):
# Detects if a body in group "player"
# If true, changes near_file_cabinet to true
	if body.is_in_group("player"):
		near_file_cabinet = true


func _on_NearFileCabinet_body_exited(body):
# Detects if a body in group "player"
# If true, changes near_file_cabinet to false
	if body.is_in_group("player"):
		near_file_cabinet = false
		$Sprite.play("closed")
		shelf_num = 0
		$Folder.visible = false

func _ready():
	set_process_input(true)

func _input(event):
	if Input.is_action_pressed("interact") and near_file_cabinet:
		open_file()

func open_file():
	if shelf_num == 0:
		$Sprite.play("open_top")
		shelf_num += 1
		$Folder.visible = true
		$Folder/File/FileSprite/Label.text = str(shelf1[0])
		$Folder/File2/FileSprite/Label.text = str(shelf1[1])
		$Folder/File3/FileSprite/Label.text = str(shelf1[2])
	elif shelf_num == 1:
		$Sprite.play("open_middle")
		shelf_num += 1
		$Folder/File/FileSprite/Label.text = str(shelf2[0])
		$Folder/File2/FileSprite/Label.text = str(shelf2[1])
		$Folder/File3/FileSprite/Label.text = str(shelf2[2])
	elif shelf_num == 2:
		$Sprite.play("open_bottom")
		shelf_num += 1
		$Folder/File/FileSprite/Label.text = str(shelf3[0])
		$Folder/File2/FileSprite/Label.text = str(shelf3[1])
		$Folder/File3/FileSprite/Label.text = str(shelf3[2])
	elif shelf_num == 3:
		$Sprite.play("closed")
		shelf_num = 0
		$Folder.visible = false
