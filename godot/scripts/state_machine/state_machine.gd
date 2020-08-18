extends Node
class_name StateMachine

export var DEBUG = true
export(NodePath) var acting_body_path

var _acting_body
var context := {}
var state: Object
var history = []

func _ready():
	_acting_body = get_node(acting_body_path)

	# Set the initial state to the first child node
	state = get_child(0)
	_enter_state()

func change_to(new_state):
	history.append(state.name)
	state = get_node(new_state)
	_enter_state()

func back():
	if history.size() > 0:
		state = get_node(history.pop_back())
		_enter_state()

func _enter_state():
	if DEBUG:
		print("Entering state: ", state.name)
	# Give the new state a reference to this state machine script
	state.fsm = self
	state.set("acting_body", _acting_body)
	state.enter()
	state.emit_signal("state_entered")

# Route Game Loop function calls to
# current state handler method if it exists
func _process(delta):
	if state.has_method("process"):
		state.process(delta)

func _physics_process(delta):
	if state.has_method("physics_process"):
		state.physics_process(delta)

func _input(event):
	if state.has_method("input"):
		state.input(event)

func _unhandled_input(event):
	if state.has_method("unhandled_input"):
		state.unhandled_input(event)

func _unhandled_key_input(event):
	if state.has_method("unhandled_key_input"):
		state.unhandled_key_input(event)
