extends Area2D

var entered = false

@onready var keyhole1 = $Keyhole
@onready var keyhole2 = $Keyhole2
@onready var digitlock = $Digitlock
@onready var chain = $Chain
@onready var player = $"../CharacterBody2D"


func _on_body_entered(_body: PhysicsBody2D):
	entered = true
	

func _on_body_exited(_body):
	entered = false
	
func _physics_process(_delta):
	if entered == true:
		if Global.flower_placed:
			return
		if Input.is_action_just_pressed("interact"):
			if !Global.lock_opened && !Global.returned:
				player.lock_ui.visible = !player.lock_ui.visible
				get_tree().paused = !get_tree().paused
			if Global.remove_item("Ключ"):
				var tween = create_tween()
				tween.tween_property(keyhole1, "modulate", Color(1, 1, 1, 0), 0.5).set_ease(Tween.EASE_OUT)
				return
			if Global.remove_item("Ключ2"):
				var tween = create_tween()
				tween.tween_property(keyhole2, "modulate", Color(1, 1, 1, 0), 0.5).set_ease(Tween.EASE_OUT)
				return
			if !Global.returned:
				return
			else:
				Global.save_current_scene_pos(player)
				SceneTransition.change_scene("res://scenes/second_room.tscn", "1")
		if Global.lock_opened and keyhole1.modulate == Color(1, 1, 1, 0) and keyhole2.modulate == Color(1, 1, 1, 0):
			await get_tree().create_timer(0.5).timeout
			var tween = create_tween()
			tween.tween_property(chain, "modulate", Color(1, 1, 1, 0), 0.5).set_ease(Tween.EASE_OUT)
			Global.returned = true
			return
		if Global.lock_opened:
			var tween = create_tween()
			tween.tween_property(digitlock, "modulate", Color(1, 1, 1, 0), 0.5).set_ease(Tween.EASE_OUT)
			Global.lock_opened = false
			
		if Global.returned:
			keyhole1.hide()
			keyhole2.hide()
			digitlock.hide()
			chain.hide()
			
