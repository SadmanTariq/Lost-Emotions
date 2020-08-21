extends GameState

const DAMPING = 20
const RETURN_THRESHOLD = 10
const SPEED := 500

var acting_body: KinematicBody2D
var velocity: Vector2

func enter():
	velocity = Vector2.RIGHT * SPEED

func physics_process(delta):
	velocity = acting_body.move_and_slide(velocity)
	
	velocity -= velocity * DAMPING * delta
	
	if velocity.length() <= RETURN_THRESHOLD:
		fsm.back()
