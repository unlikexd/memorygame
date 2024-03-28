extends Area2D

var entered = false

@onready var line = $"../LineEdit"

func _on_body_entered(body: PhysicsBody2D):
	entered = true

func _on_body_exited(body):
	entered = false
	
func _physics_process(delta):
	#var scene_path = preload("res://second_room.tscn")
	if entered == true:
		if Input.is_action_just_pressed("interact"):
			if Global.returned == false:
				line.show()
				_on_line_edit_text_submitted(line.text)
			else:
				SceneTransition.change_scene("res://second_room.tscn")

func _on_line_edit_text_submitted(new_text):
	if new_text == "7055":
		SceneTransition.change_scene("res://second_room.tscn")
