class_name BlueFairy
extends Animatronic

@export var busy_fairy: BusyFairy
@export var brave_fairy: BraveFairy
var door: Constants.Door

func reset() -> void:
	progress = 0
	door = Constants.Door.values().pick_random()
	
func _process(delta: float) -> void:
	if busy_fairy.door == door and busy_fairy.progress == 1 and progress == 4:
		locked = true
	elif brave_fairy.door == door and brave_fairy.progress == 4 and progress == 4:
		locked = true
	else:
		locked = false
	super(delta)
	pos = progress*2 + (1 if door == Constants.Door.RIGHT else 0)

func complete_movement() -> void:
	if get_tree().get_first_node_in_group("DoorHandler").doors_closed[door]:
		reset()
	else:
		pass
	
	
