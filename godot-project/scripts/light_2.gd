extends Area2D

@onready var player = $"../CharacterBody2D"
@onready var collision = $"../StaticBody2D/CollisionShape2D13"
@onready var camera = $"../CharacterBody2D/Camera2D"
@onready var bookrose = $"../BookRose"
@onready var bookitem = $"../BookItem"

var entered = false

func _on_body_entered(_body):
	entered = true

func _on_body_exited(_body):
	entered = false

func _physics_process(_delta):
	if entered == true:
		#Global.grab_controls = false
		if Input.is_action_just_pressed("interact") && !Global.animated_scene:
			bookitem.pickup_item()
			if player.position.x < 890:
				end_of_dream("move_right", Vector2(960, 3986))
			elif player.position.x >= 1030:
				end_of_dream("move_left", Vector2(960, 3986))
			elif player.position.y >= 4036:
				end_of_dream("move_up", Vector2(960, 3986))
			else:
				end_of_dream("move_down", Vector2(960, 3986))
			Global.returned = false
			Global.flower_placed = false
			Global.just_woke_up = true

func end_of_dream(move_direction, start):
	Global.grab_controls = true
	Global.animated_scene = true
	
	var tween2 = create_tween()
	tween2.tween_property(camera, "zoom", Vector2(2.0, 2.0), 0.5).set_ease(Tween.EASE_IN)
	await get_tree().create_timer(1).timeout
	
	var tween3 = create_tween()
	tween3.tween_property(bookrose, 'modulate', Color(1, 1, 1, 0), 0.5).set_ease(Tween.EASE_OUT)
	await get_tree().create_timer(0.75).timeout
	collision.set_disabled(true)
	player.anim_sprite.play(move_direction)
	var tween = create_tween()
	tween.tween_property(player, "position", start, 2).set_ease(Tween.EASE_IN)
	await get_tree().create_timer(2).timeout
	
	player.anim_sprite.play("idle_down")
	await get_tree().create_timer(2).timeout
	
	entered = false
	Global.first_entered = false
	Global.animated_scene = false
	SceneTransition.change_act("res://scenes/act_3_1.tscn", "Акт 3")
	
