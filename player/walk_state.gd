extends NodeState

# export = export them into the Godot Inspector where we can manualy choose/edit them
# we use class inheritance setting the var player with the class Player.
@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D
@export var speed: int = 50

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	# we set the dir based on user input
	var dir: Vector2 = GameInputEvents.movement_input()
	
	if dir == Vector2.UP:
		animated_sprite_2d.play("walk-b")
	elif dir == Vector2.RIGHT:
		animated_sprite_2d.play("walk-r")
	elif dir == Vector2.DOWN:
		animated_sprite_2d.play("walk-f")
	elif dir == Vector2.LEFT:
		animated_sprite_2d.play("walk-l")
	# If we don't move then make the Player dir equal with direction based on GameInput.
	if dir != Vector2.ZERO:
		player.player_dir = dir
	
	player.velocity = dir * speed
	player.move_and_slide()

func _on_next_transitions() -> void:
	if !GameInputEvents.is_movement_input():
		transition.emit("Idle")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
