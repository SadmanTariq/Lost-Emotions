extends GameState

func input(event: InputEvent):
	if event.is_action_pressed("jump"):
		fsm.change_to("Jumping")
	if event.is_action_pressed("dash"):
		fsm.change_to("DashStarting")

func physics_process(_delta):
	var x = 0
	if Input.is_action_pressed("move_right"):
		x += 1
	if Input.is_action_pressed("move_left"):
		x -= 1
		
	if x != 0:
		fsm.change_to("Walking")
	if fsm.context.has("velocity") and fsm.context["velocity"].length() > 70:
		fsm.change_to(("Walking"))
