# Node is a base class for all things that exist in 2d space.
# se face extends(inherite) pe Node pentru a putea folosi toate metodele lui
extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass

# Se va intoarce mereu in state Idle, caracterul va sta pe loc cand va face o actiune.
func _on_next_transitions() -> void:
	if !animated_sprite_2d.is_playing():
		transition.emit("Idle")

# folosim on_enter pentru ca chopping este o animatie care ruleaza iar caracterul nu se misca cu adevarat
# Vector ramane la fel asa ca ii vom spune animatiei in care directie sa ruleze
func _on_enter() -> void:
	if player.player_dir == Vector2.UP:
		animated_sprite_2d.play("chopping-b")
	elif player.player_dir == Vector2.RIGHT:
		animated_sprite_2d.play("chopping-r")
	elif player.player_dir == Vector2.DOWN:
		animated_sprite_2d.play("chopping-f")
	elif player.player_dir == Vector2.LEFT:
		animated_sprite_2d.play("chopping-l")
	else:
		animated_sprite_2d.play("chopping-f")

func _on_exit() -> void:
	animated_sprite_2d.stop()
