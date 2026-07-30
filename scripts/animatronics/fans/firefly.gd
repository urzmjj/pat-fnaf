class_name Firefly
extends Animatronic

var extinguished: bool = false

func reset() -> void:
	progress = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	pos = progress

func complete_movement() -> void:
	# call jumpscare
	pass
