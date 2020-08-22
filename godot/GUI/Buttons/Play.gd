extends Button


onready var scene = get_node("SceneChanger")

func _on_Play_pressed() -> void:
	scene.change_scene("res://main_scenes/main.tscn")
