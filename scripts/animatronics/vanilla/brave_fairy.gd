class_name BraveFairy
extends Animatronic

@export var busy_fairy: BusyFairy
@export var pos_cam_idx: Array[int]
var door: Constants.Door

func reset():
	progress = 0
	door = Constants.Door.values().pick_random()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if busy_fairy.door == door and busy_fairy.progress == 1 and progress == 4:
		locked = true
		lock_timer = 1
	else:
		locked = false
	if pos_cam_idx[pos] == get_tree().get_first_node_in_group("CameraHandler").camera_index:
		super(delta)
	super(delta)
	pos = progress*2 + (1 if door == Constants.Door.RIGHT else 0)

func complete_movement():
	if get_tree().get_first_node_in_group("DoorHandler").doors_closed[door]:
		pass
	else:
		reset()
		
