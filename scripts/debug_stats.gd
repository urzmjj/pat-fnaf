extends Node

@export var debug_label: Label
@export var fairies: Array[Animatronic]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var fairy_data = []
	for i in range(16):
		fairy_data.append_array(get_fairy_data(i))
	debug_label.text = "Time: %s    Power: %s    Temperature: %s
						Blue Fairy:    AI Level: %d    Time: %f/%f    Progress: %d/%d    Pos: %d
						Strong Fairy:    AI Level: %d    Time: %f/%f    Progress: %d/%d    Pos: %d
						Busy Fairy:    AI Level: %d    Time: %f/%f    Progress: %d/%d    Pos: %d
						Merry Fairy:    AI Level: %d    Time: %f/%f    Progress: %d/%d    Pos: %d
						Brave Fairy:    AI Level: %d    Time: %f/%f    Progress: %d/%d    Pos: %d
						Witch Fairy:    AI Level: %d    Time: %f/%f    Progress: %d/%d    Pos: %d
						Icely Toad:    AI Level: %d    Time: %f/%f    Progress: %d/%d    Pos: %d
						Fairy Dummy:    AI Level: %d    Time: %f/%f    Progress: %d/%d    Pos: %d
						Angler Fairy:    AI Level: %d    Time: %f/%f    Progress: %d/%d    Pos: %d
						Firefly:    AI Level: %d    Time: %f/%f    Progress: %d/%d    Pos: %d
						Dummy Fairy:    AI Level: %d    Time: %f/%f    Progress: %d/%d    Pos: %d
						Mime Fairy:    AI Level: %d    Time: %f/%f    Progress: %d/%d    Pos: %d
						Military Fairy:    AI Level: %d    Time: %f/%f    Progress: %d/%d    Pos: %d
						??? Fairy:    AI Level: %d    Time: %f/%f    Progress: %d/%d    Pos: %d
						Thermal Fairy:    AI Level: %d    Time: %f/%f    Progress: %d/%d    Pos: %d
						??? Fairy:    AI Level: %d    Time: %f/%f    Progress: %d/%d    Pos: %d" \
					% ([get_tree().get_first_node_in_group("Office").time_fr(), get_tree().get_first_node_in_group("Office").power_fr(), get_tree().get_first_node_in_group("Office").temp_fr()] + fairy_data)
	pass

#??? Fairy:    AI Level: %d    Time: %f/%f    Progress: %d/%d    Pos: %d

func get_fairy_data(index: int) -> Array:
	if fairies[index] == null:
		return [NAN, NAN, NAN, NAN, NAN, NAN]
	else:
		return [fairies[index].ai_level,fairies[index].timer,fairies[index].move_time,fairies[index].progress,fairies[index].stages,fairies[index].pos]
