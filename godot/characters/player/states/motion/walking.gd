extends "res://characters/player/states/motion/motion.gd"

const IDLING_THRESHOLD = 50  # X-Speed at which state switches to idle

export(NodePath) var ground_checker

signal walked_off_ledge

func physics_process(delta):
	.physics_process(delta)
		
	var speed = fsm.context[velocity_key].length()
	
	# To make it keep touching ground
	var vel = fsm.context[velocity_key]
	vel.y = 2
	fsm.context[velocity_key] = acting_body.move_and_slide_with_snap(
		vel, Vector2.DOWN, Vector2.UP)
#	fsm.context[velocity_key] = acting_body.move_and_slide(
#		vel, Vector2.UP)
	
#	acting_body.move_and_collide(vel * delta)
	
#	if !acting_body.is_on_floor():
	if !get_node(ground_checker).is_colliding():
		emit_signal("walked_off_ledge")
		fsm.change_to("Falling")
	elif speed <= IDLING_THRESHOLD:
		fsm.context[velocity_key] = Vector2()
		fsm.change_to("Idle")
