extends StaticBody2D

var terminal_location = ''
var near_terminal = false
var player

func _on_NearTerminal_body_entered(body):
# Detects if a body in group "player"
# If true, changes near_terminal to true and player to the value of body
	if body.is_in_group("player"):
		near_terminal = true
		player = body

func _on_NearTerminal_body_exited(body):
# Detects if a body in group "player"
# If true, changes near_terminal to false
	if body.is_in_group("player"):
		near_terminal = false

func _ready():
	set_process_input(true)
	
func _input(event):
	if Input.is_action_pressed("interact") and near_terminal:
		near_terminal = false
		player.changing_rooms = true
		player.to_terminal = terminal_location
