extends CharacterBody2D
var col:=false
var g:=9.8
var jheight:=1000
var pi:=PI
var dir:=Vector2()
var multi:=0.1
@onready var bun1:=$bnuy
@onready var bun2:=$bnuy2
@onready var sky := $sky
@onready var cam :=$cam
var can=true
var maxdoubl=Global.doubl
var doubl=maxdoubl
var slip:=Global.slip
var min:=0.1
var max:=Global.max
var per:=0.0
@onready var bar = $bar
@onready var over = $bar/over
var fill:=Global.fill
@onready var build := $build
@onready var jumps := $jump
@onready var dies := $die
@onready var oda := $oda
@onready var mon := $mon

func caching():
	mon.pitch_scale=randf_range(0.95,1.05)
	oda.visible=true
	mon.play()
	for i in 90:
		oda.visible=true
		await get_tree().physics_frame
	oda.visible=false
func die():
	if can==true:
		dies.play()
		bun1.visible=false
		bun2.visible=false
		bar.visible=false
		var a = load("res://bunny/death.tscn")
		var b = a.instantiate()
		b.global_position=global_position
		get_tree().current_scene.add_child(b)
		can=false
		for i in 100:
			await get_tree().physics_frame
		$blackscreen.out()
func jump():
	if col==false:
		multi=min
		bar.visible=true
		over.scale.x=0
		over.position.x=0
		per=(fill*bar.global_scale.x)/max
		build.play()
		while Input.is_action_pressed("jump"):
			if is_on_floor()==false:
				bar.visible=false
				build.stop()
				return
			if multi<max:
				multi+=fill
			if over.global_scale.x<bar.global_scale.x:
				over.global_scale.x+=per
			await get_tree().physics_frame
		build.stop()
		jumps.pitch_scale=randf_range(0.85,1.15)
		jumps.play()
		var par=load("res://bunny/smokes.tscn")
		var par1 = par.instantiate()
		if multi<max/4:
			par1.amount=5
		else:
			if multi<max/2:
				par1.amount=10
			else:
				if multi<3*max/4:
					par1.amount=15
				else:
					par1.amount=50
		par1.global_position=global_position
		get_tree().current_scene.add_child(par1)
		bar.visible=false
		if multi>max:
			multi=max
		dir=Vector2(-sin(rotation),cos(rotation))
		velocity=-jheight*dir*multi
		
	else:
		if maxdoubl>0:
			if doubl>0:
				var par=load("res://bunny/smokes.tscn")
				var par1 = par.instantiate()
				par1.emitting=false
				par1.global_position=global_position
				doubl-=1
				dir=Vector2(-sin(rotation),cos(rotation))
				velocity=-jheight*dir*1
				par1.amount=20
				jumps.play()
				get_tree().current_scene.add_child(par1)
			
func input_check():
	if Input.is_action_just_pressed("ded"):
		die()
	if Input.is_action_just_pressed("jump"):
		jump()
	if Input.is_action_pressed("left"):
		if rotation>deg_to_rad(-46):
			rotation-=deg_to_rad(2)
	if Input.is_action_pressed("right"):
		if rotation<deg_to_rad(46):
			rotation+=deg_to_rad(2)
	if Input.is_action_pressed("zin"):
		if cam.zoom<Vector2(1.5,1.5):
			cam.zoom+=Vector2(0.025,0.025)
			
	if Input.is_action_pressed("zout"):
		if cam.zoom>Vector2(0.5,0.5):
			cam.zoom-=Vector2(0.025,0.025)
			
	if Input.is_action_pressed("zet"):
		cam.zoom=Vector2(0.75,0.75)
		
func _physics_process(delta: float) -> void:
	if can==true:
		if global_position.y/100<Global.height:
			Global.height=global_position.y/100
		$blackscreen.global_position=global_position
		sky.global_position=position
		input_check()
		if is_on_floor()==false:
			velocity.y+=g*2
			col=true
			bun1.frame=1
			bun2.frame=1
			bun2.global_rotation = rotation
			bun2.position =Vector2(0,-31)
		else:
			doubl=maxdoubl
			bun2.frame=0
			bun2.global_position=position+Vector2(0,-31)
			bun2.global_rotation=0
			velocity.x*=slip
			bun1.frame=0
			col=false
		move_and_slide()
		bar.global_position=global_position+Vector2(0,48)
	else:
		velocity = Vector2(0,0)
		
