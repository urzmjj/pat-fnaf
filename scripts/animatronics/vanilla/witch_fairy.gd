class_name WitchFairy
extends Animatronic

var pokesRemaining: int
var timeRemaining: float

func reset() -> void:
	progress = 0
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	pos = progress
	if progress == stages:
		timeRemaining -= delta

func poke() -> void:
	if(progress == 0):
		return
	pokesRemaining -= 1
	timeRemaining += 0.5
	if pokesRemaining <= 0:
		reset()

func complete_movement() -> void:
	timeRemaining = (21.0-ai_level)*3/20+2
	pokesRemaining = ceili(ai_level/4.0)


func _on_area_3d_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if(event.is_action_pressed("select")):
		get_viewport().set_input_as_handled()
		poke()
