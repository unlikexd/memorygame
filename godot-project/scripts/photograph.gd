extends Area2D

@onready var bubble = $"../CharacterBody2D/TextBubble"

var entered = false

func _on_body_entered(body):
	entered = true
	print(entered)

func _on_body_exited(body):
	entered = false

func _physics_process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("interact") && Global.has_interacted && !Global.grab_controls:
			Global.dialogue_bubble(bubble, "На фотографии похожий на меня человек и кто-то неизвестный.", 2)
			await get_tree().create_timer(5).timeout
			Global.dialogue_bubble(bubble, "Сзади есть подпись: 'Любимому от Лены!'", 1)
