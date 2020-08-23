extends KinematicBody2D

enum {
	LEFT,
	RIGHT
}

signal knocked_back()

export var chase_range = 300
var direction = RIGHT setget _set_direction

func is_chasable() -> bool:
	var dist = global_position.distance_to(Globals.player.global_position)
	return $PlayerFinder.is_player_visible() and dist <= chase_range

func hit(damage=1, knockback=true):
	$Body.health -= damage
	if knockback:
		emit_signal("knocked_back")

func _change_anim(new_anim):
	if has_node("Sprite"):
		get_node("Sprite").play(new_anim)

func _set_direction(value):
	if direction == value:
		return
	
	direction = value
	if has_node("Sprite"):
		get_node("Sprite").flip_h = !get_node("Sprite").flip_h


func _on_Hitbox_body_entered(body):
	if body.has_method("hit"):
		body.hit()
		emit_signal("knocked_back")


func _on_Enemy_knocked_back():
	if $StateMachine.state.name != "Staggering":
		$StateMachine.change_to("Staggering")


func _on_Patrolling_state_entered():
	_change_anim("walk")


func _on_Chasing_state_entered():
	_change_anim("chase")


func _on_Dying_state_entered():
	_change_anim("death")
	if has_node("Hurtbox"):
		$Hurtbox.queue_free()
	if has_node("Hitbox"):
		$Hitbox.queue_free()


func _on_Body_died():
	$StateMachine.change_to("Dying")
