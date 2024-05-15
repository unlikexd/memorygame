extends AudioStreamPlayer

@onready var player = $"."

const bg_music = preload("res://OMORI OST - 004 Spaces In-between.mp3")
const bg_music_2 = preload("res://OMORI OST - 005 By Your Side..mp3")
const bg_music_3 = preload("res://OMORI OST - 044 Where We Used To Play.mp3")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
		
	player.stream = music
	player.playing = true
	player.volume_db = volume
	
func play_music_level(music_id: int):
	var level_music
	match music_id:
		1:
			level_music = bg_music
		2:
			level_music = bg_music_2
		3:
			level_music = bg_music_3
	_play_music(level_music, -25.0)
