extends CanvasLayer

@onready var label = $ActLabel

func change_scene(target: String, act: String) -> void:
	var animation = "dissolve_act" + act
	$AnimationPlayer.play(animation)
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards(animation)

func changeStage(stage_path, x, y):
	var stage = stage_path.instantiate()
	get_tree().get_root().get_child(2).free()
	get_tree().get_root().add_child(stage)
	stage.get_node("CharacterBody2D").position = Vector2(x, y)

func change_act(target: String, act_text) -> void:
	$AnimationPlayer.play('dissolve')
	label.text = act_text
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards('dissolve')
	
func change_final(target: String):
	$AnimationPlayer.play("dissolve_final")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("dissolve_final")
