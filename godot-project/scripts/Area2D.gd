extends Area2D

var entered = false

@onready var line = $"../LineEdit"
@onready var keyhole1 = $Keyhole
@onready var keyhole2 = $Keyhole2
@onready var digitlock = $Digitlock
@onready var chain = $Chain
@onready var player = $"../CharacterBody2D"


func _on_body_entered(_body: PhysicsBody2D):
	entered = true
	if Global.returned == false:
		line.show()
		var tween = create_tween()
		tween.tween_property(line, "modulate", Color(1, 1, 1, 1), 0.5).set_ease(Tween.EASE_IN)

func _on_body_exited(_body):
	entered = false
	if Global.returned == false:
		var tween = create_tween()
		tween.tween_property(line, "modulate", Color(1, 1, 1, 0), 0.5).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(0.5).timeout
		line.hide()
		line.text = "Введите код"
	
func _physics_process(_delta):
	if entered == true:
		if Global.flower_placed:
			return
		if Input.is_action_just_pressed("interact"):
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
		if digitlock.modulate == Color(1, 1, 1, 0) and keyhole1.modulate == Color(1, 1, 1, 0) and keyhole2.modulate == Color(1, 1, 1, 0):
			await get_tree().create_timer(0.5).timeout
			var tween = create_tween()
			tween.tween_property(chain, "modulate", Color(1, 1, 1, 0), 0.5).set_ease(Tween.EASE_OUT)
			Global.returned = true
			return
		if Global.returned:
			keyhole1.hide()
			keyhole2.hide()
			digitlock.hide()
			chain.hide()
			

func _on_line_edit_text_submitted(new_text):
	if new_text == "7055":
		line.hide()
		var tween = create_tween()
		tween.tween_property(digitlock, "modulate", Color(1, 1, 1, 0), 0.5).set_ease(Tween.EASE_OUT)
	else:
		line.text = "Неверно"
	line.release_focus()
	Global.grab_controls = false


func _on_line_edit_focus_entered():
	Global.grab_controls = true
	line.text = ""


func _on_line_edit_focus_exited():
	Global.grab_controls = false
	line.text = ""

