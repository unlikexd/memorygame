extends Control

@onready var label = $ColorRect2/Label
@onready var lamp = $Indicator

@export var code = ''
signal code_correct

func _on_button_pressed():
	label.text = label.text + '1'


func _on_button_2_pressed():
	label.text = label.text + '2'


func _on_button_3_pressed():
	label.text = label.text + '3'


func _on_button_4_pressed():
	label.text = label.text + '4'


func _on_button_5_pressed():
	label.text = label.text + '5'


func _on_button_6_pressed():
	label.text = label.text + '6'


func _on_button_7_pressed():
	label.text = label.text + '7'


func _on_button_8_pressed():
	label.text = label.text + '8'


func _on_button_9_pressed():
	label.text = label.text + '9'
	
func _process(delta):
	label.visible_characters = 4
	if label.get_text().length() >= 4:
		if label.get_text() == '7055':
			code = '1'
			code_correct.emit()
			lamp.color = Color(0.17, 0.59, 0.22)
			return
		lamp.color = Color(0.93, 0.11, 0.22)
		await get_tree().create_timer(1.5).timeout
		lamp.color = Color(0.93, 0.59, 0.22)
		label.text = ''
	


func _on_button_10_pressed():
	label.text = label.text + '0'
