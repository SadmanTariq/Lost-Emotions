extends GameState

signal finished
signal combo_started

export var duration = 0.267
export var combo_duration = 0.2
export var combo_opening = 0.06
export var velocity_resistance = 6
export var gravity = 1500

var acting_body: Player
var in_combo = false


func input(event: InputEvent):
	if event.is_action_pressed("attack") and $ComboTimer.is_stopped() and !in_combo:
		emit_signal("combo_started")
		in_combo = true
		$AnimationTimer.start(combo_duration)
		$ComboSound.play()

func enter():
	$AnimationTimer.start(duration)
	$ComboTimer.start(duration - combo_opening)
	$AttackSound.play()
	in_combo = false

func physics_process(delta):
	var vel = fsm.context["velocity"]
	if abs(vel.y) <= 10:
		vel = Vector2()
	var accel = -vel.normalized() * velocity_resistance
	accel.y += gravity
	
	vel += accel * delta
	vel = acting_body.move_and_slide(vel, Vector2.UP)
	fsm.context["velocity"] = vel

func _exit():
	$AnimationTimer.stop()
	$ComboTimer.stop()
	emit_signal("finished")
	fsm.back()

func _on_AnimationTimer_timeout():
	_exit()
