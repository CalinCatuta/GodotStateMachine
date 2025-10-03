extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

func _on_process(_delta : float) -> void:
	pass

# Not combined the 2 if check in a signle one bcs :
# If something else sets dir later, the sprite won’t update unless input happens again.
# It can become harder to add features like "keep idle facing the last moved direction".
func _on_physics_process(_delta : float) -> void:
		# handle animation based on player direction.
		# we get the player_dir from Player script and that get his value from Walk_state from game_input_events
		# we use the player_dir bcs we want to keep the last position when the player stop moving.
	if player.player_dir == Vector2.UP:
		animated_sprite_2d.play("idle-back")
	elif player.player_dir == Vector2.RIGHT:
		animated_sprite_2d.play("idle-right")
	elif player.player_dir == Vector2.DOWN:
		animated_sprite_2d.play("idle-front")
	elif player.player_dir == Vector2.LEFT:
		animated_sprite_2d.play("idle-left")
	else:
		animated_sprite_2d.play("idle-front")

# project setting we Maped the click mouse button for hit acction.
# we change the if check question with the Enum Tools option and the action button is the same all the time
# transition.emit will send the data to node_state_machine bcs of "child.transition.connect(transition_to)"
func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	if GameInputEvents.is_movement_input():
		transition.emit("Walk")
	if player.current_toll == DataTypes.Tools.Axe && GameInputEvents.use_tool():
		transition.emit("Chopping")
	if player.current_toll == DataTypes.Tools.Till && GameInputEvents.use_tool():
		transition.emit("Tilling")
	if player.current_toll == DataTypes.Tools.Water && GameInputEvents.use_tool():
		transition.emit("Watering")

func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
