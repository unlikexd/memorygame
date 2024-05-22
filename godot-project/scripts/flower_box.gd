extends Area2D

@onready var player = $"../CharacterBody2D"
@onready var flower = $FlowerItem

var entered = false

func _on_body_entered(body):
	entered = true


func _on_body_exited(body):
	entered = false

func _physics_process(delta):
	if entered== true:
		if Input.is_action_just_pressed("interact"):
			Global.has_interacted = true
			player.box_ui.visible = !player.box_ui.visible
			get_tree().paused = !get_tree().paused
		if Global.lock_opened:
			Global.lock_opened = false
			flower.pickup_item()
