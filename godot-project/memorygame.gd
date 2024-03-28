extends Node2D

func _ready():
	if Global.returned == false:
		$CharacterBody2D.position.x = Global.player_start_x
		$CharacterBody2D.position.y = Global.player_start_y
	else:
		$CharacterBody2D.position.x = Global.player_door_x
		$CharacterBody2D.position.y = Global.player_door_y
