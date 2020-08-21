extends GameState

export var slide_speed = 100
export var jump_speed_x = 300

var acting_body: Player

func enter():
	fsm.context["velocity"] = Vector2()
	fsm.context["jumps_left"] = max(1, fsm.context["jumps_left"])

func input(event: InputEvent):
	if event.is_action_pressed("jump"):
		fsm.context["velocity"].x = [jump_speed_x, -jump_speed_x][acting_body.move_direction]
		fsm.change_to("Jumping")
	elif event.is_action_pressed(["move_right", "move_left"][acting_body.move_direction]):
		fsm.change_to("Falling")

func physics_process(_delta):
# warning-ignore:return_value_discarded
	acting_body.move_and_slide(Vector2([-10, 10][acting_body.move_direction],
									   slide_speed), Vector2.UP)
	
	if acting_body.is_on_floor() or !acting_body.is_on_wall():
		fsm.change_to("Walking")
		return
