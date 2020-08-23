extends GameState

export var DAMPING = 20
const RETURN_THRESHOLD = 10
export var SPEED := 500

var acting_body: KinematicBody2D
var velocity: Vector2

func enter():
	velocity = acting_body.global_position - Globals.player.global_position
	velocity.y = 0
	velocity = velocity.normalized()
	velocity *= SPEED

func physics_process(delta):
	velocity = acting_body.move_and_slide(velocity)
	
	velocity -= velocity * DAMPING * delta
	
	if velocity.length() <= RETURN_THRESHOLD:
		fsm.back()
