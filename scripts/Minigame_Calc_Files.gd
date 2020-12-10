extends Node2D

var rng = RandomNumberGenerator.new()
var file_nums = []
var win_game = 0
# export (PackedScene) var MinigamePlayer

func _ready():
# Picks 3 random file numbers from 1 to 10 that the player will need to fine in order to win this minigame
# File numbers cannot be repeats
# Appends 3 unique random file numbers to file_nums
	var new_file
	for i in range(3):
		rng.randomize()
		new_file = rng.randi_range(11, 69)
		while (new_file in file_nums) or (new_file % 10 == 0):
			rng.randomize()
			new_file = rng.randi_range(11, 69)
		file_nums.append(new_file)
	$File/Label.text = str(file_nums[0])
	$File2/Label.text = str(file_nums[1])
	$File3/Label.text = str(file_nums[2])
	
	
	var files_in_cabinet
	var current_cabinet
	for i in range(6):
		files_in_cabinet = []
		for j in range(9):
			rng.randomize()
			new_file = rng.randi_range(1, 9)
			while (new_file in files_in_cabinet):
				rng.randomize()
				new_file = rng.randi_range(1, 9)
			files_in_cabinet.append(new_file)
		for index in range(9):
			files_in_cabinet[index] += (i + 1) * 10
		if i == 0:
			current_cabinet = $FileCabinet
		elif i == 1:
			current_cabinet = $FileCabinet2
		elif i == 2:
			current_cabinet = $FileCabinet3
		elif i == 3:
			current_cabinet = $FileCabinet4
		elif i == 4:
			current_cabinet = $FileCabinet5
		else:
			current_cabinet = $FileCabinet6
		current_cabinet.shelf1 = files_in_cabinet.slice(0, 2)
		current_cabinet.shelf2 = files_in_cabinet.slice(3, 5)
		current_cabinet.shelf3 = files_in_cabinet.slice(6, 8)
		current_cabinet.needed_files = [] + file_nums

func _process(delta):
	var current_cabinet
	for i in range(6):
		if i == 0:
			current_cabinet = $FileCabinet
		elif i == 1:
			current_cabinet = $FileCabinet2
		elif i == 2:
			current_cabinet = $FileCabinet3
		elif i == 3:
			current_cabinet = $FileCabinet4
		elif i == 4:
			current_cabinet = $FileCabinet5
		else:
			current_cabinet = $FileCabinet6
		
		if current_cabinet.found_file != 0:
			win_game += 1
			if current_cabinet.found_file == file_nums[0]:
				$File/Label.text = ''
				$File/Sprite.visible = true
			elif current_cabinet.found_file == file_nums[1]:
				$File2/Label.text = ''
				$File2/Sprite.visible = true
			elif current_cabinet.found_file == file_nums[2]:
				$File3/Label.text = ''
				$File3/Sprite.visible = true
			current_cabinet.found_file = 0
	
	if win_game == 3:
		print("You win!")
		win_game = 0
		get_tree().change_scene("res://scenes/Temporal_Lobe.tscn")
