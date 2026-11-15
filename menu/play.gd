extends Button


func _on_pressed() -> void:
	disabled=true
	Global.reset()
	%blackscreen.out2()


func _on_mouse_entered() -> void:
	modulate=Color.DIM_GRAY


func _on_mouse_exited() -> void:
	modulate=Color.WHITE
