extends KinematicBody2D

export var chase_range = 300

func is_chasable() -> bool:
	var dist = global_position.distance_to(Globals.player.global_position)
	return $PlayerFinder.is_player_visible() and dist <= chase_range
