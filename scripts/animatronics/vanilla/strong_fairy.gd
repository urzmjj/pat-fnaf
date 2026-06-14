class_name StrongFairy
extends Animatronic

@export var busy_fairy: BusyFairy
@export var brave_fairy: BraveFairy
@export var merry_fairy: MerryFairy
var door: Constants.Door

func reset():
	progress = 0
	door = Constants.Door.values().pick_random()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if busy_fairy.door == door and busy_fairy.progress == 1 and progress == 4:
		locked = true
	elif brave_fairy.door == door and brave_fairy.progress == 4 and progress == 4:
		locked = true
	elif merry_fairy.door == door and merry_fairy.progress == 4 and progress == 4:
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
	pass
