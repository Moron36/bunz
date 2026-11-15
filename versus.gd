extends Node2D
@onready var plr := %player
@onready var map := %map
var now := -1024
var ind :=0
var new :=0
func wingn():
	var a = load("res://platforms/winforb.tscn")
	var b = a.instantiate()
	b.global_position=Vector2(0,now)
	map.add_child(b)
func generate():
	var cruel=1
	if ind>12:
		cruel=2
	if cruel==1:
		new=1
	else:
		new=randi_range(1,2)
	if new==1:
		var rand := randi_range(1,9)
		var a = load("res://platforms/generation_"+ str(rand)+".tscn")
		var b = a.instantiate()
		b.global_position=Vector2(0,now)
		map.add_child(b)
	else:
		var rand := randi_range(1,2)
		var a = load("res://platforms/spooky_"+ str(rand)+".tscn")
		var b = a.instantiate()
		b.global_position=Vector2(0,now)
		map.add_child(b)
	now-=1024
	ind+=1
	#if map.get_child_count()>5:
		#$thorns.global_position.y=map.get_child(0).global_position.y
		#map.get_child(0).queue_free()

func _ready() -> void:
	for i in 8:
		generate()
	wingn()

func _physics_process(delta: float) -> void:
	pass
