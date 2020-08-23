extends GameState

enum Direction {
	LEFT,
	RIGHT,
	NONE
}

export var speed = 500
export(NodePath) var right_ray_path
export(NodePath) var left_ray_path

var acting_body: KinematicBody2D
var direction = Direction.RIGHT

onready var right_ray: RayCast2D = get_node(right_ray_path)
onready var left_ray:  RayCast2D = get_node(left_ray_path)

func physics_process(_delta):
	if !right_ray.is_colliding() and !left_ray.is_colliding():
		fsm.change_to("Falling")
		
	if direction == Direction.NONE:
		return
	if direction == Direction.RIGHT and !right_ray.is_colliding():
		return
	if direction == Direction.LEFT and !left_ray.is_colliding():
		return
	
	var vel = [-1, 1][direction] * Vector2.RIGHT * speed
	
	vel = acting_body.move_and_slide_with_snap(vel, Vector2.DOWN, Vector2.UP)
	
	if direction != Direction.NONE:
		acting_body.direction = direction
