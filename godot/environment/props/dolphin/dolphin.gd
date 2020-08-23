extends Area2D

export(PackedScene) var end_screen

func _on_Dolphin_body_entered(body):
	if body == Globals.player:
		get_tree().change_scene_to(end_screen)
