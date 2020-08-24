extends GameState

export var duration = 0.6

var respawn_coords: Vector2
var acting_body: Player

func _process(_delta):
	var spawnpoint = get_tree().get_nodes_in_group("spawnpoint")[0]
	
	if spawnpoint != null:
		respawn_coords = spawnpoint.global_position
		set_process(false)

func enter():
	acting_body.global_position = respawn_coords
	$Timer.start(duration)
	$AudioStreamPlayer.play()


func _on_Timer_timeout():
	fsm.change_to("Idle")
