extends Control

@onready var line = $ColorRect/LineEdit

signal correct_answer

func _on_button_pressed():
	if line.text == "ЛЕНА":
		correct_answer.emit()


func _on_line_edit_text_changed(new_text):
	var caret_pos = line.caret_column
	line.text = new_text.to_upper()
	line.caret_column = caret_pos
