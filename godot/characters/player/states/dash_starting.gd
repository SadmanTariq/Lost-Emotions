extends GameState

export var duration = 0.4
export(NodePath) var dashing_state
onready var dashing = get_node(dashing_state)

func enter():
	if !dashing.can_dash():
		fsm.back()
		return
	$Timer.start(duration)

func _on_Timer_timeout():
	fsm.change_to("Dashing")
