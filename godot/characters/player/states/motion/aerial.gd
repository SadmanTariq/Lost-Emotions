extends "res://characters/player/states/motion/motion.gd"

export var gravity = 200

func enter():
	if !fsm.context.has("jumps_left"):
		fsm.context["jumps_left"] = acting_body.num_jumps

func physics_process(delta):
	fsm.context[velocity_key].y += gravity * delta
	.physics_process(delta)
	
	if acting_body.is_on_floor():
		fsm.context["jumps_left"] = acting_body.num_jumps
		fsm.change_to("Idle")
#	elif fsm.context[velocity_key] > 0:
#		fsm.change_to("Falling")
