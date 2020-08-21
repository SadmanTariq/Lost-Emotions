class_name Player
extends KinematicBody2D

signal touched_ground

enum {
	LEFT,
	RIGHT
}

export var num_jumps = 1
export var dash_unlocked = false
export var move_direction = RIGHT setget _set_move_direction

var _grounded = false

func _ready():
	Globals.player = self

func _physics_process(_delta):
	if !_grounded and is_on_floor():
		emit_signal("touched_ground")
		_grounded = true
	elif _grounded and !is_on_floor():
		_grounded = false

func _set_move_direction(value):
	move_direction = value
	$Sprite.direction = value
	$DashParticles.direction = value
	$GrappleLine.direction = value
	$Camera.direction = value

func hit(damage=69420):
	$Body.health -= damage
