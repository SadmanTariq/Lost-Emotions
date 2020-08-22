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

export var damage = 1
export var combo_damage = 5

var _in_combo = false

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
	$Hitbox.direction = value

func hit(dmg=69420):
	$Body.health -= dmg
	print("hit")


func _on_Hitbox_body_entered(body):
	if body.has_method("hit"):
		print("hit")
		body.hit(combo_damage if _in_combo else damage)
