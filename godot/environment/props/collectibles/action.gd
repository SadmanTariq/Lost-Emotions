extends Node

signal done

export var property = ""

func do():
	if property == "":
		return
	Globals.player.set(property, true)
	emit_signal("done")
