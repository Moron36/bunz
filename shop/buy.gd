extends Button
var price

func _on_pressed() -> void:
	if Global.money>=price:
		Global.money-=price
		Global.buy(name)
		get_parent().queue_free()
	else:
		$not.play()

func _ready() -> void:
	match name:
		"jump":
			price=randi_range(5,7)+Global.dif*randi_range(1,2)
		"charge":
			price=randi_range(2,4)+Global.dif*randi_range(1,3)
		"glutton":
			price=randi_range(8,10)+Global.dif*randi_range(1,2)
		"firm":
			price=randi_range(1,5)+Global.dif*randi_range(1,3)
		"breaker":
			price=randi_range(4,6)+Global.dif*randi_range(1,3)
	$cost.text = "Buy for "+str(price)+" carrots."


func _on_mouse_entered() -> void:
	modulate=Color.DIM_GRAY


func _on_mouse_exited() -> void:
	modulate=Color.WHITE
