extends CanvasLayer
@onready var camera = get_parent()
func _process(_delta: float) -> void:
	if camera:
		pivot_o
		scale = camera.zoom
