extends StaticBody2D

func hit(_dmg=0):
	if has_node("Action"):
		get_node("Action").do()
	if has_node("Sprite"):
		get_node("Sprite").play("break")
	if has_node("Shape"):
		$Shape.queue_free()
