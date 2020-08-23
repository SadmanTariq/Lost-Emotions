extends VBoxContainer

onready var dash = get_node("Dash")
onready var double_jump = get_node("Double Jump")
onready var teleport = get_node("Teleport")


#onready var is_dash_available = get_node("../../World/Player").dash_available
#onready var is_double_jump_available = get_node("../../World/Player").double_jump_available
#onready var is_teleport_available = get_node("../../World/Player").teleport_available
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	var player = Globals.player
	
	dash.visible = player.dash_available
	double_jump.visible = player.double_jump_available
	teleport.visible = player.teleport_available
#	if is_dash_available:
#		dash.visible = true
#	else :
#		dash.visible = false
#
#	if is_double_jump_available:
#		double_jump.visible = true
#	else:
#		double_jump.visible = false
#
#
#	if is_teleport_available:
#		teleport.visible = true
#	else:
#		teleport.visible = false
