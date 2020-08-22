extends GameState

export var duration = 0.267
export var combo_duration = 0.2
export var combo_opening = 0.06
export var velocity_resistance = 6
export var gravity = 1500

var acting_body: Player


func enter():
	$AnimationTimer.start(duration)
	$ComboTimer.start(duration - combo_opening)

func physics_process(delta):
	var vel = fsm.context["velocity"]
	var accel = -vel.normalized() * velocity_resistance
	accel.y += gravity
	
	vel += accel * delta
	vel = acting_body.move_and_slide(vel, Vector2.UP)
	fsm.context["velocity"] = vel

func _exit():
	$AnimationTimer.stop()
	$ComboTimer.stop()
	fsm.back()


func _on_AnimationTimer_timeout():
	_exit()
