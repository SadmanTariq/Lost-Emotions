extends Particles2D

var direction setget _set_direction

func _set_direction(value):
	texture.current_frame = value

func _on_Dashing_state_entered():
	emitting = true

func _on_Dashing_dash_finished():
	emitting = false
