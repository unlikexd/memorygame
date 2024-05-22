@tool
extends Node2D

@export var item_name = ""
@export var item_description = ""
@export var item_texture: Texture

var scene_path = "res://scenes/inventory_item.tscn"

@onready var icon_sprite = $Sprite2D
var entered = false

func _ready():
	if not Engine.is_editor_hint():
		icon_sprite.texture = item_texture

func _process(_delta):
	if Engine.is_editor_hint():
		icon_sprite.texture = item_texture
		
	if entered and Input.is_action_just_pressed('interact'):
		var tween = create_tween()
		tween.tween_property(self, "modulate", Color(1, 1, 1, 0), 0.5).set_ease(Tween.EASE_IN)
		await get_tree().create_timer(0.5).timeout
		pickup_item()

func pickup_item():
	var item = {
		"name": item_name,
		"texture": item_texture,
		"description": item_description,
		"scene_path": scene_path
	}
	if Global.player_node:
		Global.add_item(item)
		self.queue_free()


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		entered = true
		print(entered)


func _on_area_2d_body_exited(body):
	if body.is_in_group("Player"):
		entered = false
