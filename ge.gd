extends Area2D
var ok = false

func _on_body_entered(body: Node2D) -> void:
	if ok==false:
		if body.name=="player" and get_tree().current_scene.name!="versus":
			ok=true
			get_tree().current_scene.generate()
