extends "res://characters/player/states/motion/aerial.gd"

export var coyote_duration = 0.2

func input(event: InputEvent):
	.input(event)
	if event.is_action_pressed("jump") and !$Timer.is_stopped():
		fsm.context["jumps_left"] += 1


func _on_Walking_walked_off_ledge():
	$Timer.start(coyote_duration)
