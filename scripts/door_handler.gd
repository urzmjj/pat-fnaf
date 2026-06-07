class_name DoorHandler
extends Node

@export var door_nodes: Array[Node3D]
@export var doors_closed: Array[bool]
@export var light_nodes: Array[Node3D]
@export var lights_on: Array[bool]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if get_tree().get_first_node_in_group("Office").gameState != Constants.GameState.ACTIVE:
		for i: int in range(len(doors_closed)):
			doors_closed[i] = false
			door_nodes[i].extended = false
		for i: int in range(len(lights_on)):
			lights_on[i] = false
			light_nodes[i].visible = false
		self.process_mode = Node.PROCESS_MODE_DISABLED
		return
	for i: int in range(len(doors_closed)):
		door_nodes[i].extended = doors_closed[i]
	for i: int in range(len(lights_on)):
		if lights_on[i]:
			light_nodes[i].visible = true
		else:
			light_nodes[i].visible = false


func _on_door_button_l_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if get_tree().get_first_node_in_group("Office").gameState != Constants.GameState.ACTIVE:
		return
	if(event.is_action_pressed("select")):
		get_viewport().set_input_as_handled()
		doors_closed[0] = !doors_closed[0]

func _on_door_button_r_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if get_tree().get_first_node_in_group("Office").gameState != Constants.GameState.ACTIVE:
		return
	if(event.is_action_pressed("select")):
		get_viewport().set_input_as_handled()
		doors_closed[1] = !doors_closed[1]

func _on_light_buttton_l_input_event(_camera: Node, _event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if get_tree().get_first_node_in_group("Office").gameState != Constants.GameState.ACTIVE:
		return
	var a = lights_on[0]
	lights_on[0] = Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)
	get_viewport().set_input_as_handled()

func _on_light_button_r_input_event(_camera: Node, _event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if get_tree().get_first_node_in_group("Office").gameState != Constants.GameState.ACTIVE:
		return
	var a = lights_on[1]
	lights_on[1] = Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)
	get_viewport().set_input_as_handled()

func _on_light_buttton_l_mouse_exited() -> void:
	if get_tree().get_first_node_in_group("Office").gameState != Constants.GameState.ACTIVE:
		return
	lights_on[0] = false

func _on_light_button_r_mouse_exited() -> void:
	if get_tree().get_first_node_in_group("Office").gameState != Constants.GameState.ACTIVE:
		return
	lights_on[1] = false

func powerConsumption() -> int:
	return [doors_closed[0] , doors_closed[1],  lights_on[0] , lights_on[1]].reduce(func(count, b): return count+1 if b else count, 0)
