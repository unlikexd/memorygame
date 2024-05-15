extends Node2D

@onready var player = $CharacterBody2D

func _physics_process(_delta):
	if player.position.y > 580 and player.position.y < 3600:
		player.z_index = 3
	elif player.position.y > 4030:
		player.z_index = 3
	else:
		player.z_index = 1
