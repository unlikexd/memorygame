extends Node2D

@onready var player = $"CharacterBody2D"
@onready var bubble = $CharacterBody2D/TextBubble

func _ready():
	if !Global.returned:
		starting_sequence()
		BgAudio.play()
		BgAudio.play_music_level(3)
	if Global.returned:
		Global.load_current_scene_pos(player)
	if Global.returned_2:
		Global.returned_2 = false
		player.position.x = 621
		player.position.y = 565

func starting_sequence():
	Global.grab_controls = true
	await get_tree().create_timer(3.5).timeout
	player.anim_sprite.play('idle_left')
	await get_tree().create_timer(1).timeout
	player.anim_sprite.play('idle_down')
	await get_tree().create_timer(0.75).timeout
	Global.dialogue_bubble(bubble, "Странный сон. Что он мог значить?", 2)
	await get_tree().create_timer(4.75).timeout
	Global.dialogue_bubble(bubble, "В любом случае, я чувствую себя лучше.", 2)
