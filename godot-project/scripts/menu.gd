extends Control

@onready var audio_player = $AudioStreamPlayer
@onready var menu = $Menu
@onready var options = $Options
@onready var video = $Video
@onready var audio = $Audio
@onready var master_slider = $Audio/HBoxContainer/Slider/Master
@onready var music_slider = $Audio/HBoxContainer/Slider/Music
@onready var sfx_slider = $Audio/HBoxContainer/Slider/SFX


func _ready():
	$Menu/StartButton.grab_focus()
	set_initial_volume()
	get_viewport().size = Vector2(1280, 720)
	BgAudio.stop()

func _on_start_button_pressed():
	Sfx.play_sound(2, -15.0)
	SceneTransition.change_act("res://scenes/memorygame.tscn", "Акт 1")
	audio_player.stop()
	await get_tree().create_timer(5.0).timeout

func _on_fullscreen_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_borderless_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_options_button_pressed():
	show_and_hide(options, menu)
	
func _on_video_pressed():
	show_and_hide(video, options)
	
func _on_back_from_video_pressed():
	show_and_hide(options, video)

func _on_audio_pressed():
	show_and_hide(audio, options)
	
func _on_back_from_audio_pressed():
	show_and_hide(options, audio)
	
func _on_back_pressed():
	show_and_hide(menu, options)
	
func _on_exit_button_pressed():
	get_tree().quit()
	
func _on_master_value_changed(value):
	volume(0, value)	
	
func _on_music_value_changed(value):
	volume(1, value)
	
func _on_sfx_value_changed(value):
	volume(2, value)
	
func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value)-30)
	
func set_initial_volume():
	var vol_master = AudioServer.get_bus_volume_db(0)
	var vol_music = AudioServer.get_bus_volume_db(1)
	var vol_sfx = AudioServer.get_bus_volume_db(2)
	
	master_slider.value = db_to_linear(vol_master) + 30
	music_slider.value = db_to_linear(vol_music) + 30
	sfx_slider.value = db_to_linear(vol_sfx) + 30
	
func show_and_hide(first, second):
	Sfx.play_sound(2, -15.0)
	first.show()
	second.hide()

func toggle():
	visible = !visible
	get_tree().paused = visible


