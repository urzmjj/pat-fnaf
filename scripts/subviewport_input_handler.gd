extends Area3D

@export var subviewport:SubViewport

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_input_event(_camera: Node, event: InputEvent, event_position: Vector3, _normal: Vector3, shape_idx: int) -> void:
	var local_pos: Vector3 = to_local(event_position)
	var shape: BoxShape3D = get_child(shape_idx).shape
	var ndc: Vector3 = local_pos / shape.size
	var pos_2d: Vector2 = (Vector2(ndc.x + 0.5, 0.5 - ndc.y) * Vector2(subviewport.size)).clamp(Vector2.ZERO, Vector2(subviewport.size))
	var vp_event: InputEvent = event.duplicate()
	vp_event.position = pos_2d
	vp_event.global_position = pos_2d
	subviewport.push_input(vp_event, true)
