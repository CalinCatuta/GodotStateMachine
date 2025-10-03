class_name GameInputEvents
# using static we create a "singleton"
# access the functions and variables directly from the class_name without needing to create an instance of it
static var dir: Vector2

# set the dir based on user input buttons
static func movement_input() -> Vector2:
	if Input.is_action_pressed("walk_left"):
		dir = Vector2.LEFT
	elif Input.is_action_pressed("walk_right"):
		dir = Vector2.RIGHT
	elif Input.is_action_pressed("walk_up"):
		dir = Vector2.UP
	elif Input.is_action_pressed("walk_down"):
		dir = Vector2.DOWN
	else:
		dir = Vector2.ZERO
		
	return dir

# check if he moves
static func is_movement_input() -> bool:
	if dir == Vector2.ZERO:
		return false
	else:
		return true
# check if he activate the button that run the Maped action "hit" Project Settings
static func use_tool() -> bool:
	var use_tool_value: bool = Input.is_action_just_pressed("hit")
	return use_tool_value
