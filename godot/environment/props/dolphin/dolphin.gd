extends Area2D

export var end_screen = "res://gui/scenes/end_screen.tscn"

func _on_Dolphin_body_entered(body):
	if body == Globals.player:
		$SceneChanger.change_scene(end_screen)
