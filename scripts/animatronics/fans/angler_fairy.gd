class_name AnglerFairy
extends Animatronic

var timeRemaining: float
@export var hookAnim: AnimationPlayer
@export var hook: MeshInstance3D

func reset():
	progress = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	pos = progress
	if progress == stages:
		timeRemaining -= delta
		if timeRemaining == 0:
			pass
			# call jumpscare

func complete_movement():
	hook.show()
	hookAnim.play("lower")
	timeRemaining = (21.0-ai_level)*2/20+1


func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if(event.is_action_pressed("select")):
		get_viewport().set_input_as_handled()
		reset()
		hookAnim.play("raise")
		
