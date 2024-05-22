extends Control

@onready var line = $ColorRect/LineEdit

signal correct_answer

func _on_button_pressed():
	if line.text == "ЛЕНА":
		correct_answer.emit()
