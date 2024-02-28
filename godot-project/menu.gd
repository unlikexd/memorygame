extends Control


func _ready():
	$VBoxContainer/StartButton.grab_focus()

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://memorygame.tscn")


func _on_options_button_pressed():
	pass # Replace with function body.


func _on_exit_button_pressed():
	get_tree().quit()
