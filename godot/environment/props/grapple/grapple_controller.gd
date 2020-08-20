extends Node

const activation_range = 600

func _physics_process(_delta):
	var player = Globals.player
	if player == null:
		return
	
	var nearest_anchor: Node2D
	var nearest_dist = INF
	
	for anchor in get_tree().get_nodes_in_group("grapple_anchor"):
		var dist = player.global_position.distance_to(anchor.global_position)
		if dist < nearest_dist:
			nearest_anchor = anchor
			nearest_dist = dist
	
	if nearest_dist > activation_range:
		return
	
	for anchor in get_tree().get_nodes_in_group("grapple_anchor"):
		if anchor == nearest_anchor:
			anchor.active = true
			anchor.add_to_group("active")
		else:
			anchor.active = false
			if anchor.is_in_group("active"):
				anchor.remove_from_group("active")
