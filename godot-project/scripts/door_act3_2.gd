extends Area2D

@onready var player = $"../CharacterBody2D"

var entered = false

func _on_body_entered(_body: PhysicsBody2D):
	entered = true

func _on_body_exited(_body):
	entered = false
	
func _physics_process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("interact"):
			SceneTransition.change_scene("res://scenes/act_3_1.tscn", "3")