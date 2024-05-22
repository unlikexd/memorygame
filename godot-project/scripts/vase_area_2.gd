extends Area2D

@onready var bubble = $"../CharacterBody2D/TextBubble"
@onready var player = $"../CharacterBody2D"
@onready var flower = $FlowerVase

var entered = false

func _on_body_entered(_body: PhysicsBody2D):
	entered = true
	if !Global.first_entered:
		Global.dialogue_bubble(bubble, "В вазах обычно бывают цветы. Жаль, что мне их давно никто не дарил", 4)	
		await get_tree().create_timer(6).timeout
		Global.first_entered = true

func _on_body_exited(_body):
	entered = false

func _physics_process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("interact") && Global.first_entered && Global.remove_item("Цветок"):
			Global.flower_placed = true
			var tween = create_tween()
			tween.tween_property(flower, "modulate", Color(1, 1, 1, 1), 0.5).set_ease(Tween.EASE_IN)
			Global.dialogue_bubble(bubble, "Так-то лучше.", 1)
			await get_tree().create_timer(3).timeout
			ending_sequence()
			
func ending_sequence():
	Global.grab_controls = true
	await get_tree().create_timer(2).timeout
	Global.dialogue_bubble(bubble, "Кажется, что я это уже делал", 2)
	await get_tree().create_timer(4).timeout
	player.anim_sprite.play('idle_down')
	await get_tree().create_timer(0.75).timeout
	Global.dialogue_bubble(bubble, "Все же, что за имена были на тех вещах?", 2)
	await get_tree().create_timer(4).timeout
	player.anim_sprite.play('idle_left')
	await get_tree().create_timer(0.75).timeout
	Global.dialogue_bubble(bubble, "Кажется, прошло уже много времени. Пора спать.", 2)
