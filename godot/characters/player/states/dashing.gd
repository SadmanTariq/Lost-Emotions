extends GameState

signal dash_finished

export var duration = 0.2
export var speed = 2000

var dash_available = true
var direction: Vector2
var acting_body: KinematicBody2D
var velocity_key = "velocity"

func enter():
	if !dash_available and !acting_body.is_on_floor():
		fsm.back()
		return
	
	direction = get_direction()
	
	if direction.x > 0:
		acting_body.move_direction = acting_body.RIGHT
	elif direction.x < 0:
		acting_body.move_direction = acting_body.LEFT
	
	dash_available = false
	
	$Timer.start(duration)

func physics_process(_delta):
# warning-ignore:return_value_discarded
	acting_body.move_and_slide(direction * speed)

func get_direction():
	if Input.is_action_pressed("move_left"):
		return Vector2.LEFT
	else:
		return Vector2.RIGHT


func _on_Player_touched_ground():
	dash_available = true


func _on_Timer_timeout():
	emit_signal("dash_finished")
	fsm.context[velocity_key] = speed * direction
	fsm.back()
