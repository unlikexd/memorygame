extends Area2D

var entered = false

@onready var flower = $flower
@onready var bubble = $"../CharacterBody2D/TextBubble"

func _on_body_entered(_body: PhysicsBody2D):
	entered = true


func _on_body_exited(_body):
	entered = false


func _physics_process(_delta):
	if entered == true:
		if Input.is_action_pressed("interact") && !Global.has_flower:
			Global.has_flower = true
			Global.dialogue_bubble(bubble, "Нашел. Теперь нужно вернуть тебя в вазу.", 3)
