extends AnimatedSprite

enum {
	LEFT,
	RIGHT
}

const animations = {
	"idle": {LEFT: "idle_left", RIGHT: "idle_right"},
	"walk": {LEFT: "walk_left", RIGHT: "walk_right"},
	"dash": {LEFT: "dash_left", RIGHT: "dash_right"},
}

var action = "idle" setget _set_action
var direction = RIGHT setget _set_direction

func _set_action(value):
	if action == value:
		return
		
	action = value
	animation = animations[action][direction]

func _set_direction(value):
	if direction == value:
		return
	
	direction = value
	animation = animations[action][direction]


func _on_Idle_state_entered():
	_set_action("idle")


func _on_Walking_state_entered():
	_set_action("walk")


func _on_Dashing_state_entered():
	_set_action("dash")
