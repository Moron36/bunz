extends Label

func _physics_process(delta: float) -> void:
	text = str(get_parent().get_parent().power)
