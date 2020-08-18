extends GameState

export var acceleration = 5000
export var damping = 6
export var velocity_key = "velocity"
#export var gravity = 2500

var acting_body: KinematicBody2D

func input(event: InputEvent):
	if event.is_action_pressed("jump"):
		fsm.change_to("Jumping")

func physics_process(delta):
	if !fsm.context.has(velocity_key):
		fsm.context[velocity_key] = Vector2()

	var vel: Vector2 = fsm.context[velocity_key]

	var move_x = 0

	if Input.is_action_pressed("move_right"):
		move_x += 1
	if Input.is_action_pressed("move_left"):
		move_x -= 1

	vel.x -= damping * vel.x * delta
	vel.x += acceleration * delta * move_x
	
#	vel.y += gravity * delta

	vel = acting_body.move_and_slide(vel, Vector2.UP)

	fsm.context[velocity_key] = vel

