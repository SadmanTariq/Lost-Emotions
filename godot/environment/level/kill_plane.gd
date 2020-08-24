extends Area2D

func _on_KillPlane_body_exited(body):
	if body.has_method("hit"):
		body.hit(69420)
