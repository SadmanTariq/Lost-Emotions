extends Node

onready var scene = get_node("SceneChanger")




func _on_Return_to_main_pressed() -> void:
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	scene.change_scene("res://gui/scenes/title_screen.tscn")
