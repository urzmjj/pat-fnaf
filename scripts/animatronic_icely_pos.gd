extends Control

@export var animatronic: Animatronic
@export var pos: int
@export var audio_player: AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if animatronic.pos == pos and get_tree().get_first_node_in_group("Office").gameState == Constants.GameState.ACTIVE:
		visible = true
		if not audio_player.playing:
			audio_player.play()
	else:
		visible = false
		if audio_player.playing:
			audio_player.stop()
