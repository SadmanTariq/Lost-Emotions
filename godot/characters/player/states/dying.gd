extends GameState

export var duration = 0.6

func enter():
	$Timer.start(duration)


func _on_Timer_timeout():
	fsm.change_to("Respawning")
