class_name BusyFairy
extends Animatronic

var door: Constants.Door

func reset():
	progress = 0
	door = Constants.Door.values().pick_random()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	pos = 0 if progress == 0 else (2 if door == Constants.Door.RIGHT else 1)

func complete_movement():
	pass
