class_name Settings
extends PopupPanel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"TabContainer/Video/FPS/Label2".text = ("%d" % [$"TabContainer/Video/FPS/HSlider".value]) if $"TabContainer/Video/FPS/HSlider".value != 0 else "AUTO"
	$"TabContainer/Audio/Master/Label2".text = "%d%%" % [$"TabContainer/Audio/Master/HSlider".value]
	pass


func _on_visibility_changed() -> void:
	if visible:
		load_settings()
	else:
		save_settings()
		
func save_settings():
	ProjectSettings.set_setting("application/run/max_fps", $"TabContainer/Video/FPS/HSlider".value)
			
func load_settings():
	$"TabContainer/Video/FPS/HSlider".value = Engine.max_fps
	pass

func _on_fps_slider_drag_ended(value_changed: bool) -> void:
	if not value_changed: return
	Engine.max_fps = $"TabContainer/Video/FPS/HSlider".value

func _on_window_mode_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
		2:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)

func _on_vsync_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

func _on_master_vol_drag_ended(value_changed: bool) -> void:
	if not value_changed: return
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"),$"TabContainer/Audio/Master/HSlider".value/100.0)
