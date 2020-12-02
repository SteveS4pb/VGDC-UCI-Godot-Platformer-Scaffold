extends Area2D

var shelf = [0, 0, 0]


func _input(event):
	if Input.is_action_pressed("click"):
		if get_parent().get_parent().shelf_num == 1:
			shelf = get_parent().get_parent().shelf1
		elif get_parent().get_parent().shelf_num == 2:
			shelf = get_parent().get_parent().shelf2
		elif get_parent().get_parent().shelf_num == 3:
			shelf = get_parent().get_parent().shelf3
		
		if shelf[0] in get_parent().get_parent().needed_files:
			get_parent().get_parent().needed_files.erase(shelf[0])
			get_parent().get_parent().found_file = shelf[0]
