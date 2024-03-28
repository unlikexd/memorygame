extends CanvasLayer

func change_scene(target: String) -> void:
	$AnimationPlayer.play('dissolve')
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards('dissolve')
	
func changeStage(stage_path, x, y):
	var stage = stage_path.instantiate()
	get_tree().get_root().get_child(2).free()
	get_tree().get_root().add_child(stage)
	stage.get_node("CharacterBody2D").position = Vector2(x, y)
