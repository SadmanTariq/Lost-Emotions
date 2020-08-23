extends "res://characters/enemies/states/motion/motion.gd"

func input(event):
	if event.is_action_pressed("grapple"):
		fsm.change_to("Staggering")

func physics_process(delta):
	.physics_process(delta)
	
	if !acting_body.is_chasable():
		fsm.change_to("Patrolling")
		return
		
	var dir := Globals.player.global_position - acting_body.global_position
	dir.y = 0
	dir = dir.normalized()
	
	if dir.x > 0:
		direction = Direction.RIGHT
	elif dir.x < 0:
		direction = Direction.LEFT
	else:
		direction = Direction.NONE
