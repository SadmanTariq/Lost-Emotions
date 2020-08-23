extends Area2D

export var panning_speed = 3

var active = false
var camera_def_pos: Vector2
var camera_def_speed: float

func _input(event):
	if !active:
		return
	if event.is_action_pressed("interact"):
		start()
	elif event.is_action_released("interact"):
		stop()

func start():
	camera_def_pos = Globals.camera.position
	camera_def_speed = Globals.camera.smoothing_speed
	if has_node("Target"):
		Globals.camera.global_position = get_node("Target").global_position
		Globals.camera.smoothing_speed = panning_speed
	
func stop():
	Globals.camera.position = camera_def_pos
	Globals.camera.smoothing_speed = camera_def_speed

func _show_tooltip():
	$TooltipTween.stop_all()
	$TooltipTween.interpolate_property($Tooltip, "alpha", 0, 1, 0.1)
	$TooltipTween.start()
func _hide_tooltip():
	$TooltipTween.stop_all()
	$TooltipTween.interpolate_property($Tooltip, "alpha", 1, 0, 0.1)
	$TooltipTween.start()


func _on_Binoculars_body_entered(body):
	if body != Globals.player:
		return
	
	active = true
	_show_tooltip()


func _on_Binoculars_body_exited(body):
	if body != Globals.player:
		return
	
	active = false
	_hide_tooltip()
	stop()
