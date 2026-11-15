extends Node2D

func _process(delta: float) -> void:
	global_rotation=0
	global_position=get_parent().global_position+Vector2(0,-96.0)
