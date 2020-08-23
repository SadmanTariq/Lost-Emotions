class_name Player
extends KinematicBody2D

signal touched_ground

enum {
	LEFT,
	RIGHT
}

# FOR MASRUR
# Use these values for indicators
var double_jump_available setget ,_is_double_jump_available
var dash_available        setget ,_is_dash_available
var teleport_available    setget ,_is_teleport_available

# Do NOT use these for indicators
export var num_jumps = 0
export var dash_unlocked = false
export var teleport_unlocked = false
export var walljump_unlocked = false
export var grapple_unlocked = false
var double_jump_unlocked setget _set_double_jump_unlocked

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

func _is_double_jump_available():
	return $StateMachine.context.has("jumps_left") and $StateMachine.context["jumps_left"] > 0

func _is_dash_available():
	return dash_unlocked and $StateMachine/Dashing.dash_available

func _is_teleport_available():
	return teleport_unlocked and $StateMachine/TeleportOut.available

func _set_double_jump_unlocked(value: bool):
	if value:
		num_jumps = 1
	else:
		num_jumps = 0


func _on_Hitbox_body_entered(body):
	if body.has_method("hit"):
		if _in_combo:
			print("combo")
		body.hit(combo_damage if _in_combo else damage)


func _on_Attacking_combo_started():
	_in_combo = true


func _on_Attacking_finished():
	_in_combo = false


func _on_Body_died():
	$StateMachine.change_to("Dying")
