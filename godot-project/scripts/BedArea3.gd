extends Area2D

var entered = false
@onready var player = $"../CharacterBody2D"
@onready var bubble = $"../CharacterBody2D/TextBubble"
@onready var bed = $".."

func _on_body_entered(body):
	entered = true


func _on_body_exited(body):
	entered = false

func _physics_process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("interact"):
			var tween = create_tween()
			tween.tween_property(bed, "position", Vector2(140, 0), 3).set_ease(Tween.EASE_OUT)
