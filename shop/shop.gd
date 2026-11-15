extends Sprite2D

func _ready() -> void:
	while self!=null:
		var b=1
		for i in 45:
			global_position.y+=b
			b-=0.04
			await get_tree().physics_frame
		b=1
		for i in 45:
			global_position.y-=b
			b-=0.04
			await get_tree().physics_frame
