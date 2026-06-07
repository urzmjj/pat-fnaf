extends Node3D

var extended: bool = false
var modelExtended: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if extended != modelExtended:
		if extended:
			get_node("AnimationPlayer").play("wall_extend")
			modelExtended = true
		else:
			get_node("AnimationPlayer").play("wall_retract")
			modelExtended = false
