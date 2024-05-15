extends Area2D

@onready var player = $"../CharacterBody2D"
@onready var collision = $"../StaticBody2D/CollisionShape2D8"
@onready var camera = $"../CharacterBody2D/Camera2D"

var entered = false

func _on_body_entered(_body):
	entered = true

func _on_body_exited(_body):
	entered = false

func _physics_process(_delta):
	if entered == true:
		#Global.grab_controls = false
		if Input.is_action_just_pressed("interact"):
			if player.position.x < 3115:
				end_of_dream("move_right", Vector2(3168, 445))
			elif player.position.y >= 445:
				end_of_dream("move_up", Vector2(3168, 445))
			else:
				end_of_dream("move_down", Vector2(3168, 445))
			Global.returned = false
			Global.flower_placed = false
			Global.just_woke_up = true

func end_of_dream(move_direction, start):
	Global.grab_controls = true
	Global.animated_scene = true
	
	var tween2 = create_tween()
	tween2.tween_property(camera, "zoom", Vector2(2.0, 2.0), 0.5).set_ease(Tween.EASE_IN)
	await get_tree().create_timer(1).timeout
	
	collision.set_disabled(true)
	player.anim_sprite.play(move_direction)
	var tween = create_tween()
	tween.tween_property(player, "position", start, 2).set_ease(Tween.EASE_IN)
	await get_tree().create_timer(2).timeout
	
	player.anim_sprite.play("idle_down")
	Global.animated_scene = false
	await get_tree().create_timer(2).timeout
	
	Global.first_entered = false
	entered = false
	SceneTransition.change_act("res://scenes/act_2_1.tscn", "Акт 2")
	
