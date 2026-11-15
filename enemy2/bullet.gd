extends CharacterBody2D
var dir=Vector2()
var c:=StaticBody3D
func _process(delta: float) -> void:
	velocity=dir*1000
	move_and_slide()


func _on_area_body_entered(body: Node2D) -> void:
	if body.name!="player" and body!=c:
		queue_free()
