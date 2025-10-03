class_name Player
extends CharacterBody2D

# Setare state None default. Enum state -> data_types
@export var current_toll: DataTypes.Tools = DataTypes.Tools.None
# Daca jucatorul nu sta pe loc atunci setam direction din obj player cu cea din GameInputEvents.
var player_dir: Vector2
