extends Node2D

@onready var player = $"CharacterBody2D"

func _ready():
	if Global.returned_2:
		Global.load_current_scene_pos(player)
