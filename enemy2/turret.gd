extends StaticBody2D
var e
func create(z : Vector2):
	e=load("res://enemy2/bullet.tscn").instantiate()
	e.dir=z
	e.global_position=global_position
	e.c=self
	get_tree().current_scene.add_child(e)

func _ready() -> void:
	while self!=null:
		$shoot.play()
		create(Vector2(0,1))
		create(Vector2(0,-1))
		create(Vector2(-1,0))
		create(Vector2(1,0))
		for i in 45:
			await get_tree().physics_frame
		for i in 15:
			rotation+=deg_to_rad(3)
			await get_tree().physics_frame
		$shoot.play()
		create(Vector2(1,1))
		create(Vector2(1,-1))
		create(Vector2(-1,-1))
		create(Vector2(-1,1))
		for i in 45:
			await get_tree().physics_frame
		for i in 15:
			rotation+=deg_to_rad(3)
			await get_tree().physics_frame
