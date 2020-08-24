extends GameState

export var duration = 0.1

var acting_body: Player

func enter():
	if !acting_body.grapple_unlocked:
		fsm.back()
		return
	var active_anchors = get_tree().get_nodes_in_group("active_anchor")
	if active_anchors.size() <= 0:
		fsm.back()
		return
	
	var to_anchor = active_anchors[0].global_position - acting_body.global_position
	
	if to_anchor.x > 0:
		acting_body.move_direction = acting_body.RIGHT
	else:
		acting_body.move_direction = acting_body.LEFT
	
	$Timer.start(duration)
	$AudioStreamPlayer.play()

func _on_Timer_timeout():
	fsm.change_to("Grappling")
