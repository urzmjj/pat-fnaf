class_name AILoader
extends Node

@export var animatronics: Array[Animatronic]

func init_ai_levels(ai_levels: Array[int]):
	for i in range(len(animatronics)):
		if is_instance_valid(animatronics[i]):
			animatronics[i].ai_level = ai_levels[i]
