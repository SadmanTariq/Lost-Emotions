extends "res://characters/player/states/motion/motion.gd"

export var gravity = 200
export var jump_speed = 200

func enter():
	fsm.context[velocity_key].y = -jump_speed

func physics_process(delta):
	fsm.context[velocity_key].y += gravity * delta	
	.physics_process(delta)
	
	if acting_body.is_on_floor():
		fsm.change_to("Idle")
#	elif fsm.context[velocity_key] > 0:
#		fsm.change_to("Falling")
