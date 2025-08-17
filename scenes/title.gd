extends Control


func _ready() -> void:
	$TitleSound.play()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		get_tree().change_scene_to_file("res://scenes/level.tscn")
		


func _on_title_sound_finished() -> void:
	$TitleSound.play()
