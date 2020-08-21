extends GameState

export var duration = 0.3
export(NodePath) var sprite

var acting_body: Player
var available = true
var factor = 0


func enter():
	if !available and !acting_body.is_on_floor():
		fsm.back()
		return
	
	fsm.context["teleport_direction"] = _get_direction()
	
	factor = 0
	available = false

func process(delta):
	factor = clamp(factor + delta / duration, 0, 1)
	get_node(sprite).material.set_shader_param("factor", factor)
	
	if factor >= 1:
		fsm.change_to("TeleportIn")

func _get_direction():
	var dir = Vector2()
	if Input.is_action_pressed("move_right"):
		dir.x += 1
	if Input.is_action_pressed("move_left"):
		dir.x -= 1
	if Input.is_action_pressed("move_down"):
		dir.y += 1
	if Input.is_action_pressed("move_up"):
		dir.y -= 1
	
	if dir.length() == 0:
		dir = [Vector2.LEFT, Vector2.RIGHT][acting_body.move_direction]
	
	return dir.normalized()


func _on_Player_touched_ground():
	available = true
