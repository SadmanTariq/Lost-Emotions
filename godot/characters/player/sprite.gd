extends AnimatedSprite

enum {
	LEFT,
	RIGHT
}

const animations = {
	"idle": {LEFT: "idle_left", RIGHT: "idle_right"},
	"walk": {LEFT: "walk_left", RIGHT: "walk_right"},
	"jump": {LEFT: "jump_left", RIGHT: "jump_right"},
	"fall": {LEFT: "fall_left", RIGHT: "fall_right"},
	"dash": {LEFT: "dash_left", RIGHT: "dash_right"},
	"dash_start": {LEFT: "dash_start_left", RIGHT: "dash_start_right"},
	"wall_hug": {LEFT: "wall_hug_left", RIGHT: "wall_hug_right"},
	"teleport": {LEFT: "teleport_left", RIGHT: "teleport_right"},
	"grapple_start": {LEFT: "grapple_start_left", RIGHT: "grapple_start_right"},
	"attack1": {LEFT: "attack1_left", RIGHT: "attack1_right"},
	"attack2": {LEFT: "attack2_left", RIGHT: "attack2_right"},
}

var action = "idle" setget _set_action
var direction = RIGHT setget _set_direction

func _set_action(value):
	if action == value:
		return
		
	action = value
	play(animations[action][direction])

func _set_direction(value):
	if direction == value:
		return
	
	direction = value
	play(animations[action][direction])


func _on_Idle_state_entered():
	_set_action("idle")


func _on_Walking_state_entered():
	_set_action("walk")


func _on_Dashing_state_entered():
	_set_action("dash")


func _on_DashStarting_state_entered():
	_set_action("dash_start")


func _on_Jumping_state_entered():
	_set_action("jump")


func _on_Falling_state_entered():
	_set_action("fall")


func _on_TeleportOut_state_entered():
	_set_action("teleport")


func _on_WallHugging_state_entered():
	_set_action("wall_hug")


func _on_GrappleStarting_state_entered():
	_set_action("grapple_start")


func _on_Attacking_state_entered():
	_set_action("attack1")


func _on_Attacking_combo_started():
	_set_action("attack2")
