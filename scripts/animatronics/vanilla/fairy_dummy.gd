class_name FairyDummy
extends Animatronic

var door: Constants.Door

func reset():
	progress = 0
	door = Constants.Door.values().pick_random()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	pos = progress

func complete_movement():
	pass
