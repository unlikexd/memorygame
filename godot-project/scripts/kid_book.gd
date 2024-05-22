extends Area2D

@onready var bubble = $"../CharacterBody2D/TextBubble"

var entered = false

func _on_body_entered(body):
	entered = true

func _on_body_exited(body):
	entered = false

func _physics_process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("interact") && Global.has_interacted && !Global.grab_controls:
			Global.dialogue_bubble(bubble, "В корзине есть документы.", 1)
			await get_tree().create_timer(4).timeout
			Global.dialogue_bubble(bubble, "Хммм. Здесь человек, очень похожий на меня, и рядом написано имя Михаил", 3)
