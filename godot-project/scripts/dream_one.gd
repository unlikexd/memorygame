extends Node2D

@onready var hide_spawn = $HideStart
@onready var hidden_collision = $StaticBody2D/CollisionShape2D7
@onready var player = $CharacterBody2D
@onready var bubble = $CharacterBody2D/TextBubble
var no_return = false

func _ready():
	BgAudio.play()
	BgAudio.play_music_level(1)

func _physics_process(_delta):
	if player.position.x > 1200:
		no_return = true
		hidden_collision.disabled = false
		hide_spawn.visible = true
	if player.position.y > 485:
		player.z_index = 3
	else:
		player.z_index = 1


func _on_area_2d_body_entered(_body):
	if no_return:
		await get_tree().create_timer(2).timeout
		Global.dialogue_bubble(bubble, "Кажется, пути назад нет", 2)
