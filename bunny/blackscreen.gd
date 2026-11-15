extends Sprite2D
func out4():
	visible=true
	for i in 20:
		self_modulate.a += 0.05
		await get_tree().physics_frame
	get_tree().change_scene_to_file("res://versus.tscn")
func menu():
	visible=true
	for i in 20:
		self_modulate.a += 0.05
		await get_tree().physics_frame
	get_tree().change_scene_to_file("res://menu/mainmenu.tscn")
func bunzwin():
	visible=true
	for i in 20:
		self_modulate.a += 0.05
		await get_tree().physics_frame
	get_tree().change_scene_to_file("res://william/bunzwin.tscn")
func wilwin():
	visible=true
	for i in 20:
		self_modulate.a += 0.05
		await get_tree().physics_frame
	get_tree().change_scene_to_file("res://william/wiliamwin.tscn")
func out3():
	visible=true
	for i in 20:
		self_modulate.a += 0.05
		await get_tree().physics_frame
	get_tree().quit()
func out2():
	visible=true
	for i in 20:
		self_modulate.a += 0.05
		await get_tree().physics_frame
	get_tree().change_scene_to_file("res://maingame.tscn")

func out():
	visible=true
	for i in 20:
		self_modulate.a += 0.05
		await get_tree().physics_frame
	get_tree().change_scene_to_file("res://shop/shop.tscn")


func _ready() -> void:
	visible=true
	for i in 20:
		self_modulate.a -= 0.05
		await get_tree().physics_frame
	visible=false
