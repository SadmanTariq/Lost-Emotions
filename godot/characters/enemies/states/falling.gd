extends GameState

export var acceleration = 3000
#export(NodePath) var right_ray_path
#export(NodePath) var left_ray_path

var acting_body: KinematicBody2D
var velocity: Vector2

#onready var right_ray: RayCast2D = get_node(right_ray_path)
#onready var left_ray:  RayCast2D = get_node(left_ray_path)

func enter():
	velocity = Vector2()

func physics_process(delta):
	velocity += Vector2.DOWN * acceleration * delta
	
	velocity = acting_body.move_and_slide(velocity, Vector2.UP)
	
	if acting_body.is_on_floor():
		_exit()

func _exit():
	# TODO: fall damage
	fsm.back()
