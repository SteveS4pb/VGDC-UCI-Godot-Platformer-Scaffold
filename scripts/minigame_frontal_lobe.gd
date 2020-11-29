extends Node



var currentTime = 0
var stepTime = 1000
var playerPosition = [0,8]
var playerDirection = 0  # 0 north, 1 east, 2 south, 3 west
var field = [
			['x','x','x','x','x','x','x','x','x'],
			['x','o','o','o','o','x','o','o','o'],
			['x','o','x','x','o','o','o','x','x'],
			['x','o','x','x','x','x','x','x','x'],
			['x','o','o','o','o','o','o','o','x'],
			['x','x','x','x','x','x','x','o','x'],
			['x','x','o','o','o','x','x','o','x'],
			['o','o','o','x','o','o','o','o','x'],
			['o','x','x','x','x','x','x','x','x']
		]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	updateInputs()
	currentTime += delta
	while currentTime > stepTime:
		currentTime -= stepTime
		step()
	updateDisplay()

func step():
	var newPosition = playerPosition
	match playerDirection:
		0:
			newPosition[1] -= 1
		1:
			newPosition[0] += 1
		2:
			newPosition[1] += 1
		3:
			newPosition[0] -= 1
	if 0 > newPosition[0] > 8 and 0 > newPosition[1] > 8:
		if field[newPosition[0]][newPosition[1]] == 'o':
			playerPosition = newPosition
	else:
		# Restart minigame
		playerPosition = [0,8]
		playerDirection = 0

func updateInputs():
	if Input.get_action_strength("right"):
		playerDirection = 1
	elif Input.get_action_strength("left"):
		playerDirection = 3
	elif Input.get_action_strength("up"):
		playerDirection = 0
	elif Input.get_action_strength("down"):
		playerDirection = 2

func updateDisplay():
	pass
