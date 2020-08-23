extends GameState

signal finished

export var acceleration = 200
export var start_speed = 200
export var finish_range = 30

var acting_body: Player
var velocity: Vector2
var anchor: Node2D
var direction: Vector2

func enter():
	var active_anchors = get_tree().get_nodes_in_group("active_anchor")
	if active_anchors.size() <= 0:
		fsm.change_to("Walking")
		return
	anchor = get_tree().get_nodes_in_group("active_anchor")[0]
	direction = (anchor.global_position - acting_body.global_position).normalized()
	velocity = direction * start_speed

#func input(event: InputEvent):
#	if event.is_action_released("grapple"):
#		_exit()

func physics_process(delta):
	if acting_body.global_position.distance_to(anchor.global_position) <= finish_range:
		_exit()
		return
	
	velocity += direction * acceleration * delta

	velocity = acting_body.move_and_slide(velocity, Vector2.UP)
	
	if velocity.dot(anchor.global_position - acting_body.global_position) <= 0:
		_exit()
		
	if !Input.is_action_pressed("grapple"):
		_exit()
	

func _exit():
	fsm.context["velocity"] = velocity
	fsm.change_to("Falling")
	emit_signal("finished")
