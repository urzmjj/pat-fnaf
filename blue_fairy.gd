class_name BlueFairy
extends Animatronic

var door: Constants.Door

func reset() -> void:
	progress = 0
	door = Constants.Door.values().pick_random()
	
func _process(delta: float) -> void:
	super(delta)
	pos = progress*2 + (1 if door == Constants.Door.RIGHT else 0)

func complete_movement() -> void:
	if get_tree().get_first_node_in_group("DoorHandler").doors_closed[door]:
		reset()
	else:
		pass
	
	
