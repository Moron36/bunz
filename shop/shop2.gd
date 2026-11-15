extends Node2D
var a
var b
var c
var maxi=5
func _ready() -> void:
	a=randi_range(1,maxi)
	b=randi_range(1,maxi)
	while b==a:
		b=randi_range(1,maxi)
	c=randi_range(1,maxi)
	while c==a or c==b:
		c=randi_range(1,maxi)
	var d = load("res://shop/item_"+str(a)+".tscn")
	var e = d.instantiate()
	e.global_position=$yes1.global_position
	add_child(e)
	d = load("res://shop/item_"+str(b)+".tscn")
	e = d.instantiate()
	e.global_position=$yes2.global_position
	add_child(e)
	d = load("res://shop/item_"+str(c)+".tscn")
	e = d.instantiate()
	e.global_position=$yes3.global_position
	add_child(e)
	
