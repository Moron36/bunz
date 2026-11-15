extends Button


func _on_pressed() -> void:
	disabled=true
	%blackscreen.out3()


func _on_mouse_entered() -> void:
	modulate=Color.DIM_GRAY


func _on_mouse_exited() -> void:
	modulate=Color.WHITE
