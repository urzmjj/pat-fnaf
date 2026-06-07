class_name CameraHandler
extends Node

@export var cameras: Array[Camera3D]
@export var camera_screen_object: Node3D
@export var button_group: ButtonGroup
var camera_visible: bool = false
var camera_index: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_group.pressed.connect(_on_button_group_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if not cameras[camera_index].current:
		cameras[camera_index].make_current()
	if(Input.is_action_just_pressed("camera")):
		if camera_visible:
			get_tree().get_first_node_in_group("Office").powerConsumption -= 1
		else:
			get_tree().get_first_node_in_group("Office").powerConsumption += 1
		camera_visible = not camera_visible
		get_viewport().set_input_as_handled()
	camera_screen_object.visible = camera_visible
	
func _on_button_group_pressed(button: BaseButton) -> void:
	camera_index = int(button.name)
