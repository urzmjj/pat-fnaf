class_name StrongFairy
extends Animatronic

@export var busy_fairy: BusyFairy
@export var brave_fairy: BraveFairy
@export var merry_fairy: MerryFairy
@export var pos_cam_idx: Array[int]
var door: Constants.Door
var stall_timer: float = 0

func reset():
	progress = 0
	door = Constants.Door.values().pick_random()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if busy_fairy.door == door and busy_fairy.progress == 1 and progress == 4:
		locked = true
		lock_timer = 1
	elif brave_fairy.door == door and brave_fairy.progress == 4 and progress == 4:
		locked = true
		lock_timer = 1
	elif merry_fairy.door == door and merry_fairy.progress == 4 and progress == 4:
		locked = true
		lock_timer = 1
	else:
		locked = false
	if pos_cam_idx[pos] == get_tree().get_first_node_in_group("CameraHandler").camera_index:
		stall_timer = 1
	else:
		stall_timer = max(0, stall_timer - delta)
	if stall_timer > 0:
		locked = true
	super(delta)
	pos = progress*2 + (1 if door == Constants.Door.RIGHT else 0)


func complete_movement():
	pass
