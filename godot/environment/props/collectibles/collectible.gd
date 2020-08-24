extends StaticBody2D

signal used
export(String, MULTILINE) var explanation = ""

func _ready():
	$Explanation/Label.text = explanation

func hit(_dmg=0):
	if has_node("Action"):
		get_node("Action").do()
	if has_node("Sprite"):
		get_node("Sprite").play("break")
	if has_node("Shape"):
		$Shape.queue_free()
	emit_signal("used")
