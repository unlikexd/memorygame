extends Area2D

var entered = false
@onready var player = $"../CharacterBody2D"
@onready var bubble = $"../CharacterBody2D/TextBubble"
@onready var bookcase = $".."
@onready var book_me = $"../Me"
@onready var book_family = $"../Family"
@onready var heaven = $"../../heavensdoor"
@onready var heavenlight = $"../../heavensdoor/heavenlight"


func _on_body_entered(body):
	entered = true


func _on_body_exited(body):
	entered = false

func _physics_process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("interact"):
			if Global.remove_item("Я"):
				book_me.visible = true
				return
			if Global.remove_item("Семья"):
				book_family.visible = true
				return
			if book_family.visible && book_me.visible:
				var tween = create_tween()
				tween.tween_property(bookcase, "position", Vector2(-320, -110), 3).set_ease(Tween.EASE_OUT)
				await get_tree().create_timer(3).timeout
				var tween2 = create_tween()
				tween2.tween_property(heaven, "modulate", Color(1, 1, 1, 1), 1.5).set_ease(Tween.EASE_IN)
				await get_tree().create_timer(1.5).timeout
				var tween3 = create_tween()
				tween3.tween_property(heavenlight, "scale", Vector2(1.521, 1.495), 1).set_ease(Tween.EASE_IN)
