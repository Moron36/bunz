extends StaticBody2D
var c
var durabil=120
func _on_ar_body_entered(body: Node2D) -> void:
	if body.name=="player" or body.name=="plr":
		c=true
		if abs(body.velocity.length())>200:
			durabil-=40
		if abs(body.velocity.length())>600:
			durabil-=40
		if abs(body.velocity.length())>1000:
			durabil-=40




func _on_ar_body_exited(body: Node2D) -> void:
	if body.name=="player" or body.name=="plr":
		c=false


func _physics_process(delta: float) -> void:
	if c==true:
		durabil-=1
	if durabil>80:
		$spr.frame=0
	if durabil<=80 and durabil>40:
		$spr.frame=1
	if durabil<=40:
		$spr.frame=2
	if durabil<=0:
		var z = load("res://tiles/shards.tscn")
		var zz = z.instantiate()
		Global.glas.play()
		zz.global_position=global_position
		get_tree().current_scene.add_child(zz)
		queue_free()


func _on_spr_frame_changed() -> void:
	$sad.play()
