extends "res://characters/player/states/motion/aerial.gd"

export var jump_speed = 200
export(NodePath) var falling_state

func enter():
	.enter()
	
	var coyote = get_node(falling_state).coyote
	var free_jump = acting_body.is_on_floor() or (acting_body.is_on_wall() and acting_body.walljump_unlocked) or coyote
	if fsm.context["jumps_left"] <= 0 and !free_jump:
		fsm.back()
		return
	
	if !free_jump:
		fsm.context["jumps_left"] -= 1
	fsm.context[velocity_key].y = -jump_speed

func physics_process(delta):
	.physics_process(delta)
	if fsm.context[velocity_key].y > 0 or !Input.is_action_pressed("jump"):
		fsm.change_to("Falling")
