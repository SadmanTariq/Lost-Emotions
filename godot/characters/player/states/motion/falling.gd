extends "res://characters/player/states/motion/aerial.gd"

export var max_fall_speed = 500
export var coyote_duration = 0.2

func input(event: InputEvent):
	.input(event)
	if event.is_action_pressed("jump") and !$Timer.is_stopped():
		fsm.context["jumps_left"] += 1

func physics_process(delta):
	.physics_process(delta)
	fsm.context[velocity_key].y = min(fsm.context[velocity_key].y, max_fall_speed)

func _on_Walking_walked_off_ledge():
	$Timer.start(coyote_duration)
