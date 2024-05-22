extends Node2D

@onready var player = $"CharacterBody2D"
@onready var bubble = $CharacterBody2D/TextBubble
@onready var bed = $BedBody
@onready var book = $BookMe


func _ready():
	if !Global.returned:
		starting_sequence()
		BgAudio.play()
		BgAudio.play_music_level(4)
	if Global.returned:
		Global.load_current_scene_pos(player)
		bed.position.x = 140
		if book != null:
			book.queue_free()

func starting_sequence():
	Global.grab_controls = true
	player.anim_sprite.play('idle_right')
	await get_tree().create_timer(3.5).timeout
	Global.dialogue_bubble(bubble, "Снова эти сны. И снова этот цветок.", 2)
	await get_tree().create_timer(4).timeout
	Global.grab_controls = true
	player.anim_sprite.play('idle_left')
	await get_tree().create_timer(1).timeout
	Global.dialogue_bubble(bubble, "Что? Почему я заперт? Где я?", 2)
	await get_tree().create_timer(4).timeout
	Global.grab_controls = true
	player.anim_sprite.play('idle_down')
	await get_tree().create_timer(0.75).timeout
	Global.dialogue_bubble(bubble, "Это не мой дом. Нужно найти его.", 2)
