extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var rot_x: float = PI*2*(0.5-get_viewport().get_mouse_position().x/get_viewport().get_visible_rect().size.x)
	var rot_y: float = clampf(PI*2*(0.5-get_viewport().get_mouse_position().y/get_viewport().get_visible_rect().size.y), -PI/2, PI/2)
	transform.basis = Basis()
	rotate_object_local(Vector3(0, 1, 0), rot_x)
	rotate_object_local(Vector3(1, 0, 0), rot_y)
