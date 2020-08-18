extends "res://characters/player/states/motion/motion.gd"

const IDLING_THRESHOLD = 70  # Speed at which state switches to idle

func physics_process(delta):
	.physics_process(delta)
	
	var speed = fsm.context[velocity_key].length()
	
	if speed  <= IDLING_THRESHOLD:
		fsm.change_to("Idle")
