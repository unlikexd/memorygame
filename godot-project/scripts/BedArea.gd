extends Area2D

var entered = false
@onready var player = $"../CharacterBody2D"
@onready var bubble = $"../CharacterBody2D/TextBubble"

func _on_body_entered(_body: PhysicsBody2D):
	entered = true

func _on_body_exited(_body):
	entered = false
	
func _physics_process(_delta):
	if entered == true:
		if Global.just_woke_up:
			starting_sequence()
		if Input.is_action_just_pressed("interact") && Global.flower_placed:
			SceneTransition.change_scene("res://scenes/dream_one.tscn", "1")

#
func starting_sequence():
	Global.just_woke_up = false
	Global.grab_controls = true
	await get_tree().create_timer(4).timeout
	player.anim_sprite.play('idle_right')
	await get_tree().create_timer(0.75).timeout
	player.anim_sprite.play('idle_up')
	await get_tree().create_timer(0.75).timeout
	player.anim_sprite.play('idle_right')
	await get_tree().create_timer(0.75).timeout
	player.anim_sprite.play('idle_down')
	await get_tree().create_timer(0.75).timeout
	Global.dialogue_bubble(bubble, "Кажется, чего-то не хватает", 3)
	
