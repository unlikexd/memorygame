extends Node2D

@onready var lena_bubble = $Lena/TextBubble
@onready var misha_bubble = $CharacterBody2D/TextBubble

func _ready():
	BgAudio.play_music_level(6)
	Global.animated_scene = true
	await get_tree().create_timer(1.5).timeout
	the_end()

func the_end():
	Global.dialogue_bubble(lena_bubble, "...и тогда ты в первый раз подарил мне синие розы...", 3)
	await get_tree().create_timer(5).timeout
	Global.dialogue_bubble(misha_bubble, "Лена? Лена, это ты? Я так отчетливо тебя помню", 2)
	await get_tree().create_timer(4).timeout
	Global.dialogue_bubble(lena_bubble, "Миша, ты вспомнил! Но... Это значит, что конец уже близко", 2)
	await get_tree().create_timer(4).timeout
	Global.dialogue_bubble(misha_bubble, "Да, но наверное это к лучшему. Я наверняка доставил вам много хлопот", 3)
	await get_tree().create_timer(5).timeout
	Global.dialogue_bubble(lena_bubble, "Не говори так! Мы все заботились о тебе", 1)
	await get_tree().create_timer(3).timeout
	Global.dialogue_bubble(misha_bubble, "Спасибо. Спасибо вам за всё", 2)
	await get_tree().create_timer(4.5).timeout
	Global.dialogue_bubble(misha_bubble, "Я думаю, будет лучше, если я уйду, чем стану просто пустой оболочкой себя", 3)
	await get_tree().create_timer(5).timeout
	Global.dialogue_bubble(lena_bubble, "Нам всем было тяжко. Прости, что не смогли тебе помочь", 3)
	await get_tree().create_timer(5.5).timeout
	Global.dialogue_bubble(misha_bubble, "Не волнуйся, всё к лучшему", 1.5)
	await get_tree().create_timer(4).timeout
	Global.dialogue_bubble(misha_bubble, "Не забывайте иногда приходить ко мне, хорошо?", 2)
	await get_tree().create_timer(4).timeout
	Global.dialogue_bubble(lena_bubble, "Конечно, милый, мы никогда тебя не забудем", 2)
	await get_tree().create_timer(4).timeout
	Global.dialogue_bubble(misha_bubble, "Я вас всех очень сильно люблю. Я рад, что смог вспомнить об этом хотя бы еще раз", 4)
	await get_tree().create_timer(5).timeout
	SceneTransition.change_final("res://scenes/the_end.tscn")
