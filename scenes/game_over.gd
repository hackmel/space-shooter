extends Control


func _ready() -> void:
	$GameOverSound.play()
	$CenterContainer/VBoxContainer/ScoreText.text = "Score: " + str(Global.score)
	Global.score = 0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		get_tree().change_scene_to_file("res://scenes/level.tscn")
	if event.is_action_pressed("escape"):
		get_tree().quit()
