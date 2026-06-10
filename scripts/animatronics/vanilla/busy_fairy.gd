class_name BusyFairy
extends Animatronic

var door: Constants.Door

func reset():
	progress = 0
	door = Constants.Door.values().pick_random()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	pos = 0 if progress == 0 else (2 if door == Constants.Door.RIGHT else 1)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	pos = progress

func complete_movement():
	pass
