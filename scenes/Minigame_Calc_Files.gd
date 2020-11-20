extends Node2D

var rng = RandomNumberGenerator.new()
var file_nums = []
# export (PackedScene) var MinigamePlayer

func _ready():
# Picks 3 random file numbers from 1 to 10 that the player will need to fine in order to win this minigame
# File numbers cannot be repeats
# Appends 3 unique random file numbers to file_nums

	var file
	for i in range(3):
		rng.randomize()
		file = rng.randi_range(0, 10)
		while (file in file_nums):
			print(file)
			rng.randomize()
			file = rng.randi_range(0, 10)
		file_nums.append(file)
		print(file)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
