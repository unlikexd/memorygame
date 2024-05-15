extends Node

var returned = false
var returned_2 = false
var has_flower = false
var flower_placed = false
var first_entered = false
var just_woke_up = true
var got_first_key = false
var animated_scene = false
var has_interacted = false
var pos_x = 0
var pos_y = 0

var grab_controls = false

var inventory = []
var player_node: Node = null

@onready var inventory_slot_scene = preload("res://scenes/inventory_slot.tscn")

signal inventory_updated

func _ready():
	inventory.resize(6)

func dialogue_bubble(element: Label, text, end_sec):
	element.visible_ratio = 0
	element.modulate = Color(1, 1, 1, 1)
	Global.grab_controls = true
	element.text = text
	var tween = create_tween()
	tween.tween_property(element, "visible_ratio", 1, end_sec)
	await get_tree().create_timer(end_sec + 2).timeout
	var tween2 = create_tween()
	tween2.tween_property(element, "modulate", Color(1, 1, 1, 0), 0.5).set_ease(Tween.EASE_OUT)
	Global.grab_controls = false


func add_item(item):
	for i in range(inventory.size()):
		if inventory[i] == null:
			inventory[i] = item
			inventory_updated.emit()
			return true
	return false
	
func remove_item(item_name):
	for i in range(inventory.size()):
		if inventory[i] != null and inventory[i]["name"] == item_name:
			inventory[i] = null
			inventory_updated.emit()
			return true
	return false
	
func set_player_reference(player):
	player_node = player
	

func save_current_scene_pos(player):
	pos_x = player.position.x
	pos_y = player.position.y
	
func load_current_scene_pos(player):
	player.position.x = pos_x
	player.position.y = pos_y
