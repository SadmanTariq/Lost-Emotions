extends Node

signal done

export var property = ""

func do():
	if property == "":
		return
	Globals.player.set(property, true)
	$AnimationPlayer.play("default")
	emit_signal("done")
