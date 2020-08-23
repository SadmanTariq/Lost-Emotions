extends GameState

export var distance = 100
export var duration = 0.3
export(NodePath) var sprite

var acting_body: Player
var factor = 1
var started = false


#func _enter_tree():

func enter():
	factor = 1
	started = false
#	if acting_body.test_move(Transform2D(0, new_pos), Vector2()):
#		print("colliding")

func _physics_process(_delta):
	if Globals.player == null:
		return
	var __ = $OpeningFinder.find_opening(Globals.player.global_position)
	set_physics_process(false)

func physics_process(_delta):
	if started:
		return
	$OpeningFinder.global_position = acting_body.global_position
	acting_body.global_position = _get_new_pos()
#	$OpeningFinder.global_position = _get_new_pos()
	started = true

func process(delta):
	if !started:
		return
		
	factor = clamp(factor - delta / duration, 0, 1)
	get_node(sprite).material.set_shader_param("factor", factor)
	
	if factor <= 0:
		fsm.change_to("Walking")

func _get_new_pos():
	var pos = acting_body.global_position + fsm.context["teleport_direction"] * distance
	
	if $OpeningFinder.is_blocked(pos):
		return acting_body.global_position
	
	return pos + $OpeningFinder.find_opening(pos)
