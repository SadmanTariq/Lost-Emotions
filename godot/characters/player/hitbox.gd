extends Area2D

enum {
	LEFT,
	RIGHT
}

var direction = RIGHT setget _set_direction

func _set_direction(value):
	if direction == value:
		return
		
	direction = value

#	rotate(PI)

	var polygon = $CollisionPolygon2D.polygon
	for i in range(polygon.size()):
		var new_point = polygon[i]
		new_point.x = -new_point.x
		$CollisionPolygon2D.polygon[i] = new_point
#	$CollisionPolygon2D.polygon = new_polygon


func _on_Attacking_state_entered():
	$CollisionPolygon2D.disabled = false
