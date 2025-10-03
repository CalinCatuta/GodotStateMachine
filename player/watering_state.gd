# Node is a base class for all things that exist in 2d space.
# extends = inherite so we can use his methods.
extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass

# Go back to Idle if the player isn't moving
func _on_next_transitions() -> void:
	if !animated_sprite_2d.is_playing():
		transition.emit("Idle")

# we use on_enter bcs the player ins't moving when tilling and the action is a animation not a Vector2 movement.
# keep the player direction/Vector2 in the same direction the player was when he was moving.
func _on_enter() -> void:
	if player.player_dir == Vector2.UP:
		animated_sprite_2d.play("wattering-b")
	elif player.player_dir == Vector2.RIGHT:
		animated_sprite_2d.play("wattering-r")
	elif player.player_dir == Vector2.DOWN:
		animated_sprite_2d.play("wattering-f")
	elif player.player_dir == Vector2.LEFT:
		animated_sprite_2d.play("wattering-l")
	else:
		animated_sprite_2d.play("wattering-f")

func _on_exit() -> void:
	animated_sprite_2d.stop()
