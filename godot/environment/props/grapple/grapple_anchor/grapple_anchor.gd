extends Node2D

var active = false setget _set_active

func _set_active(value):
	active = value
	$IndicatorSprite.visible = value
