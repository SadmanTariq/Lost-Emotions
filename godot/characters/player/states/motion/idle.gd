extends GameState

func physics_process(_delta):
	var x = 0
	if Input.is_action_pressed("move_right"):
		x += 1
	if Input.is_action_pressed("move_left"):
		x -= 1
		
	if x != 0:
		fsm.change_to("Walking")
