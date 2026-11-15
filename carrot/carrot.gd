extends Area2D
var a = true

func _ready() -> void:
	while a==true:
		var b=1
		for i in 30:
			global_position.y+=b
			b-=0.05
			await get_tree().physics_frame
		b=1
		for i in 30:
			global_position.y-=b
			b-=0.05
			await get_tree().physics_frame


func _on_body_entered(body: Node2D) -> void:
	if body.name=="player" or body.name=="william":
		body.caching()
		var a =load("res://carrot/carrotget.tscn")
		var b = a.instantiate()
		b.global_position=global_position
		get_tree().current_scene.add_child(b)
		Global.money+=Global.carot
		queue_free()
	if body.name=="plr":
		queue_free()
