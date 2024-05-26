extends AudioStreamPlayer

@onready var player = $"."

@onready var timer = $Timer
@onready var sel = preload("res://select.ogg")
@onready var sfx_1 = preload("res://OMORI OST - 176 The Truth cut.mp3")
@onready var sfx_2 = preload("res://step.mp3")

func _play_sfx(sfx: AudioStream, volume = 0.0):
	#var vol_music = BgAudio.volume_db
	#BgAudio.volume_db = vol_music - linear_to_db(3)
	player.stream = sfx
	player.playing = true
	player.volume_db = volume
	#await player.finished
	#BgAudio.volume_db = vol_music
	
	
func play_sound(sfx_id: int, volume = -10.0):
	var sfx
	match sfx_id:
		1:
			sfx = sfx_1
		2: 
			sfx = sel
		3:
			sfx = sfx_2
	_play_sfx(sfx, volume)
	
func play_steps():
	if player.stream == sfx_2:
		return
	Sfx.play_sound(3, -15.0)

