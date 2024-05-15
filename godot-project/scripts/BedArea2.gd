extends Area2D

var entered = false
@onready var player = $"../CharacterBody2D"
@onready var bubble = $"../CharacterBody2D/TextBubble"


func _on_body_entered(body):
	entered = true


func _on_body_exited(body):
	entered = false
	
func _physics_process(delta):
	if entered == true:
		if Global.just_woke_up:
			starting_sequence()
		if Input.is_action_just_pressed("interact") && Global.flower_placed:
			SceneTransition.change_scene("res://scenes/dream_two.tscn", '2')
			
func starting_sequence():
	Global.just_woke_up = false
	Global.grab_controls = true
	await get_tree().create_timer(4).timeout
	player.anim_sprite.play('idle_left')
	await get_tree().create_timer(1).timeout
	player.anim_sprite.play('idle_down')
	await get_tree().create_timer(0.75).timeout
	Global.dialogue_bubble(bubble, "Странный сон. Что он мог значить?", 2)
	await get_tree().create_timer(4.75).timeout
	Global.dialogue_bubble(bubble, "В любом случае, я чувствую себя лучше", 2)
