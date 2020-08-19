extends "res://characters/player/states/motion/motion.gd"

const IDLING_THRESHOLD = 50 # Speed at which state switches to idle

signal walked_off_ledge

func physics_process(delta):
	.physics_process(delta)
		
	var speed = fsm.context[velocity_key].length()
	
	# To make it keep touching ground
	var vel = fsm.context[velocity_key]
	fsm.context[velocity_key] = acting_body.move_and_slide(Vector2(vel.x, 2), Vector2.UP)
	
	if speed <= IDLING_THRESHOLD:
		fsm.context[velocity_key] = Vector2()
		fsm.change_to("Idle")
	elif !acting_body.is_on_floor():
		emit_signal("walked_off_ledge")
		fsm.change_to("Falling")
