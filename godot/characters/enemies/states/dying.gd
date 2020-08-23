extends GameState

export var duration = 3

func enter():
	$Timer.start(duration)

func _on_Timer_timeout():
	owner.queue_free()
