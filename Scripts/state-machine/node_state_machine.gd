class_name NodeStateMachine
extends Node


# The state to start with when the game begins. Choosed in Inspector.
@export var initial_node_state : NodeState

# A dictionary to hold all available states, mapped by their lowercase name.
var node_states : Dictionary = {}
# Keeps track of the currently active state.
var current_node_state : NodeState
var current_node_state_name : String

func _ready() -> void:
	# When this node enters the scene tree, collect all child nodes that are NodeState.
	for child in get_children():
		if child is NodeState:
			# Store them in the dictionary using their lowercase name as the key.
			node_states[child.name.to_lower()] = child
			# Connect each state's "transition" signal to this state machine's transition_to() function.
			child.transition.connect(transition_to)
	# If there is an initial state defined, enter it immediately.
	if initial_node_state:
		initial_node_state._on_enter()
		current_node_state = initial_node_state


func _process(delta : float) -> void:
	# Every frame, update the active state (if one exists).
	if current_node_state:
		current_node_state._on_process(delta)


func _physics_process(delta: float) -> void:
	# Every physics frame, update the active state.
	if current_node_state:
		current_node_state._on_physics_process(delta)
		# After physics processing, check if the state wants to trigger a transition.
		current_node_state._on_next_transitions()

# from the states will get from .emit(name) then we use that to stay in the state or change it.
# we use the Dictionary and find it by key using the name and call _on_enter on that state.
func transition_to(node_state_name : String) -> void:
	# Ignore transition if we're already in the requested state.
	if node_state_name == current_node_state.name.to_lower():
		return
	
	var new_node_state = node_states.get(node_state_name.to_lower())
	# Look up the new state by name.
	if !new_node_state:
		return
	# Call the exit logic on the current state before leaving.
	if current_node_state:
		current_node_state._on_exit()
		# Call the enter logic on the new state.
	new_node_state._on_enter()
	
	current_node_state = new_node_state
	current_node_state_name = current_node_state.name.to_lower()
	print("Current State: ", current_node_state_name)
