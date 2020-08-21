extends RayCast2D

func _process(_delta):
	if Globals.player == null:
		return 

	cast_to = Globals.player.global_position - global_position

func is_player_visible() -> bool:
	return get_collider() == Globals.player
