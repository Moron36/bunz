extends CharacterBody2D
var dir = Vector2(1,0)
func _ready() -> void:
	var c = randi_range(1,2)
	if c==2:
		dir=-dir
	while self!=null:
		var b = 1
		for i in 60:
			global_position.y+=b
			b+=0.1
			await get_tree().physics_frame
		b=1
		for i in 60:
			global_position.y-=b
			b+=0.1
			await get_tree().physics_frame

func _process(delta: float) -> void:
	velocity=dir*500
	move_and_slide()


func _on_bounc_body_entered(body: Node2D) -> void:
	if body.name=="player":
		body.die()
	else:
		dir=-dir
