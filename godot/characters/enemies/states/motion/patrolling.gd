extends "res://characters/enemies/states/motion/motion.gd"

#enum Direction {
#	LEFT,
#	RIGHT
#}
#
#export(Direction) var direction = Direction.RIGHT
#export(NodePath) var right_ray_path
#export(NodePath) var left_ray_path
#export var speed = 200

#var acting_body: KinematicBody2D
#onready var right_ray: RayCast2D = get_node(right_ray_path)
#onready var left_ray:  RayCast2D = get_node(left_ray_path)

func physics_process(delta):
	.physics_process(delta)
	_check_direction()
	
	if acting_body.is_chasable():
		fsm.change_to("Chasing")

func _check_direction():
	if direction == Direction.RIGHT and !right_ray.is_colliding():
		direction = Direction.LEFT
	elif direction == Direction.LEFT and !left_ray.is_colliding():
		direction = Direction.RIGHT
