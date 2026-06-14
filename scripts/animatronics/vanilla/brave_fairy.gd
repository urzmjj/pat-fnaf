class_name BraveFairy
extends Animatronic

@export var busy_fairy: BusyFairy
var door: Constants.Door

func reset():
	progress = 0
	door = Constants.Door.values().pick_random()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if busy_fairy.door == door and busy_fairy.progress == 1 and progress == 4:
		locked = true
	else:
		locked = false
	pass # Replace with function body.
	pos = progress*2 + (1 if door == Constants.Door.RIGHT else 0)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	pos = progress

func complete_movement():
	if get_tree().get_first_node_in_group("DoorHandler").doors_closed[door]:
		pass
	else:
		reset()
		
