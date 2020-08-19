extends KinematicBody2D

signal touched_ground

export var num_jumps = 1
export var dash_unlocked = false

var _grounded = false

func _physics_process(_delta):
	if !_grounded and is_on_floor():
		emit_signal("touched_ground")
		_grounded = true
	elif _grounded and !is_on_floor():
		_grounded = false
