extends GameState

export var speed = 500
export(NodePath) var right_ray_path
export(NodePath) var left_ray_path

var acting_body: KinematicBody2D

onready var right_ray: RayCast2D = get_node(right_ray_path)
onready var left_ray:  RayCast2D = get_node(left_ray_path)

func input(event):
	if event.is_action_pressed("grapple"):
		fsm.change_to("Staggering")

func physics_process(_delta):
	if !acting_body.is_chasable():
		fsm.change_to("Patrolling")
		return
		
	var dir := Globals.player.global_position - acting_body.global_position
	dir.y = 0
	dir = dir.normalized()
	
	if dir.x > 0 and !right_ray.is_colliding():
		return
	elif dir.x < 0 and !left_ray.is_colliding():
		return
	
	var vel = dir * speed
	vel = acting_body.move_and_slide_with_snap(vel, Vector2.DOWN, Vector2.UP)
	
