extends Node2D

const activation_range = 600

func _physics_process(_delta):
	var player = Globals.player
	if player == null:
		return
	
	var nearest_anchor: Node2D
	var nearest_dist = INF
	
	var space_state = get_world_2d().direct_space_state
	
	for anchor in get_tree().get_nodes_in_group("grapple_anchor"):
		if !space_state.intersect_ray(player.global_position, anchor.global_position, [player]):
			var dist = player.global_position.distance_to(anchor.global_position)
			if dist < nearest_dist:
				nearest_anchor = anchor
				nearest_dist = dist
	
	if nearest_dist > activation_range:
		return
	
	for anchor in get_tree().get_nodes_in_group("grapple_anchor"):
		if anchor == nearest_anchor:
			anchor.active = true
			anchor.add_to_group("active_anchor")
		else:
			anchor.active = false
			if anchor.is_in_group("active_anchor"):
				anchor.remove_from_group("active_anchor")
