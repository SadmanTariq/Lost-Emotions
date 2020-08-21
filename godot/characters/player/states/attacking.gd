extends GameState

export var duration = 0.267
export var combo_duration = 0.2
export var combo_opening = 0.06


func enter():
	$AnimationTimer.start(duration)
	$ComboTimer.start(duration - combo_opening)

