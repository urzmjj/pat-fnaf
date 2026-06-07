class_name IcelyToad
extends Animatronic

var sequence: Array[String] = [
	'C',
	'B',
	'A',
]

@export var audio_player: AudioStreamPlayer
@export var audio_streams : Array[AudioStream]

var sequence_index: int = 0

func reset() -> void:
	progress = 0
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	pos = progress

func _input(event: InputEvent) -> void:
	if progress != 1:
		return
	if event is InputEventKey and event.pressed:
		if event.as_text_keycode() == sequence[sequence_index]:
			sequence_index += 1
			if sequence_index == sequence.size():
				audio_player.stream = audio_streams[randi_range(0,len(audio_streams)-1)]
				audio_player.play()
				progress = 0
				sequence_index = 0
		else:
			sequence_index = 0

func complete_movement() -> void:
	pass
