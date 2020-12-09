extends StaticBody2D

var minigame_location = ''
var near_minigame = false
var player

func _on_NearMinigameTerminal_body_entered(body):
# Detects if a body in group "player"
# If true, changes near_file_cabinet to true
	if body.is_in_group("player"):
		near_minigame = true
		player = body

func _on_NearMinigameTerminal_body_exited(body):
# Detects if a body in group "player"
# If true, changes near_file_cabinet to false
	if body.is_in_group("player"):
		near_minigame = false

func _ready():
	set_process_input(true)
	
func _input(event):
	if Input.is_action_pressed("interact") and near_minigame:
		near_minigame = false
		player.changing_rooms = true
		player.to_minigame = minigame_location
