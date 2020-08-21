extends Node2D

#func _physics_process(delta):
#	print(find_opening(get_global_mouse_position()))


func is_blocked(pos: Vector2) -> bool:
	global_position = pos
#	
#	for ray in get_children():
#		print(ray.cast_to, ray.is_colliding())
#		if !ray.is_colliding():
#			print("not blocked")
#			return false
#
#	print("blocked")
#	return true
	var space_state = get_world_2d().direct_space_state
	return space_state.intersect_point(pos).size() >= 1

func find_opening(from: Vector2) -> Vector2:
	global_position = from
	var to_opening = Vector2()
	
	for ray in get_children():
		to_opening += _get_offset(ray)
	
	print(to_opening)
	return to_opening

func _get_offset(ray: RayCast2D):
	if !ray.is_colliding():
		return Vector2()
	
	return ray.get_collision_point() - (ray.global_position + ray.cast_to)
