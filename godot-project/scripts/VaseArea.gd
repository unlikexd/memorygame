extends Area2D

var entered = false

@onready var flower = $FlowerVase
@onready var bubble = $"../CharacterBody2D/TextBubble"
@onready var player = $"../CharacterBody2D"

func _on_body_entered(_body: PhysicsBody2D):
	entered = true
	if !Global.first_entered:
		Global.first_entered = true
		Global.dialogue_bubble(bubble,
		 "Странно, не помню, чтобы в вазе не было цветка. Наверное, надо вернуть его на место. Но где он может быть?",
		4)	
	
func _on_body_exited(_body):
	entered = false
	
	
func _physics_process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("interact") && Global.remove_item("Роза"):
			Global.flower_placed = true
			var tween = create_tween()
			tween.tween_property(flower, "modulate", Color(1, 1, 1, 1), 0.5).set_ease(Tween.EASE_IN)
			Global.dialogue_bubble(bubble, "Так-то лучше.", 1)
			await get_tree().create_timer(3).timeout
			ending_sequence()
		if Input.is_action_just_pressed("interact") and !Global.returned:
			Global.dialogue_bubble(bubble, "На бумажке написаны числа 7055. Стоит запомнить", 2)
			

func ending_sequence():
	Global.grab_controls = true
	await get_tree().create_timer(2).timeout
	Global.dialogue_bubble(bubble, "А этот цветок точно здесь всегда был?", 2)
	await get_tree().create_timer(4).timeout
	player.anim_sprite.play('idle_down')
	await get_tree().create_timer(0.75).timeout
	Global.dialogue_bubble(bubble, "Что-то устал я от этих поисков.", 2)
	await get_tree().create_timer(4).timeout
	player.anim_sprite.play('idle_left')
	await get_tree().create_timer(0.75).timeout
	Global.dialogue_bubble(bubble, "Наверное, мне стоит прилечь.", 1)
