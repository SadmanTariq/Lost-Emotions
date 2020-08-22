class_name Body
extends Node

signal health_changed(new_health)
signal died

export var health = 1 setget _set_health

func _set_health(value):
	health = max(value, 0)  # cannot be negative
	if health <= 0:
		emit_signal("died")
	
	emit_signal("health_changed")
