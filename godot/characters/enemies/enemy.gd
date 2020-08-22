extends KinematicBody2D

signal knocked_back()

export var chase_range = 300

func is_chasable() -> bool:
	var dist = global_position.distance_to(Globals.player.global_position)
	return $PlayerFinder.is_player_visible() and dist <= chase_range

func hit(damage=1, knockback=true):
	$Body.health -= damage
	if knockback:
		emit_signal("knocked_back")


func _on_Hitbox_body_entered(body):
	if body.has_method("hit"):
		body.hit()
		emit_signal("knocked_back")


func _on_Enemy_knocked_back():
	if $StateMachine.state.name != "Staggering":
		$StateMachine.change_to("Staggering")
