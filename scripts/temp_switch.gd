class_name TempSwitch
extends Node3D

var flipped: bool = false
var modelFlipped: bool = false
var fanFlipped: bool = true
@export var fanAnimator: AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fanAnimator.play("fan_spin")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if flipped != modelFlipped:
		if flipped:
			get_node("Cube/AnimationPlayer").play("hot")
			modelFlipped = true
		else:
			get_node("Cube/AnimationPlayer").play("cold")
			modelFlipped = false
	if get_tree().get_first_node_in_group("Office").gameState != Constants.GameState.ACTIVE:
		fanAnimator.speed_scale = 0
		return
	if flipped != fanFlipped:
		if flipped:
			fanAnimator.speed_scale = 0
			fanFlipped = true
		else:
			fanAnimator.speed_scale = 3
			fanFlipped = false


func _on_area_3d_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if(event.is_action_pressed("select")):
		get_viewport().set_input_as_handled()
		flipped = not flipped
