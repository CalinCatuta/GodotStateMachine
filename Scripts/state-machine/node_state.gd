class_name NodeState
# Node is a base class for all things that exist in 2d space.
# se face extends(inherite) pe Node pentru a putea folosi toate metodele lui
extends Node

@warning_ignore("unused_signal")
signal transition 


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	pass


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	pass
