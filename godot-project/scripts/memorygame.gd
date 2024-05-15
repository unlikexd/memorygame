extends Node2D


@onready var player = $CharacterBody2D
@onready var key1 = $InventoryItem
@onready var key2 = $InventoryItem2



func _ready():
	if !Global.returned:
		BgAudio.play()
		BgAudio.play_music_level(2)
	if Global.returned:
		Global.load_current_scene_pos(player)


func _physics_process(_delta):
	if Global.inventory != [null, null, null, null, null, null] and !Global.got_first_key:
		Global.got_first_key = true
		player.inventory_ui.visible = !player.inventory_ui.visible
		get_tree().paused = !get_tree().paused
	if Global.returned == true and key1 != null and key2 != null:
		key1.hide()
		key2.hide()
		
	if key1 == null and key2 != null:
		key2.position.x = 970
		key2.position.y = 455
		
	if key2 == null and key1 != null:
		key1.position.x = 859
		key1.position.y = 614
