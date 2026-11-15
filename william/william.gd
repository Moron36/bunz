extends CharacterBody2D
var dir :=Vector2()
var power:=1
var col:=false
func caching():
	if power<5:
		$mon.pitch_scale=randf_range(0.95,1.05)
		$mon.play()
		power+=1
func place3():
	if col==false:
		if power>=5 and abs((%plr.global_position-global_position).length())>350:
			power-=5
			$place.play()
			col=true
			var b = load("res://enemy2/turret.tscn").instantiate()
			b.global_position=global_position
			get_tree().current_scene.add_child(b)
		else:
			$bad.play()
	else:
		$bad.play()
func place2():
	if col==false:
		if power>=2 and abs((%plr.global_position-global_position).length())>350:
			power-=2
			$place.play()
			col=true
			var b = load("res://enemy1/eyed.tscn").instantiate()
			b.global_position=global_position
			get_tree().current_scene.add_child(b)
		else:
			$bad.play()
	else:
		$bad.play()
func place1():
	if col==false:
		if power>=2 and abs((%plr.global_position-global_position).length())>350:
			power-=2
			$place.play()
			col=true
			var b = load("res://tiles/saw.tscn").instantiate()
			b.global_position=global_position
			get_tree().current_scene.add_child(b)
		else:
			$bad.play()
	else:
		$bad.play()
func inputs():
	dir=Vector2.ZERO
	if Input.is_action_pressed("fleshleft"):
		dir+=Vector2(-1,0)
	if Input.is_action_pressed("fleshright"):
		dir+=Vector2(1,0)
	if Input.is_action_pressed("fleshdown"):
		dir+=Vector2(0,1)
	if Input.is_action_pressed("fleshup"):
		dir+=Vector2(0,-1)
	if Input.is_action_just_pressed("place1"):
		place1()
	if Input.is_action_just_pressed("place2"):
		place2()
	if Input.is_action_just_pressed("place3"):
		place3()
	if dir.x!=0 and dir.y!=0:
		dir/=sqrt(2)
func _physics_process(delta: float) -> void:
	$bar.global_position=global_position-Vector2(0,-48.0)
	if col==true:
		$bar.visible=true
		$bar/over.scale.x+=0.005
		if $bar/over.scale.x>=1:
			col=false
	else:
		$bar/over.scale.x=0
		$bar.visible=false
	inputs()
	velocity=dir*800
	move_and_slide()
