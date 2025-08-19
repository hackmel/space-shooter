extends CanvasLayer

static  var lifeImage = load("res://graphics/life.png")

func _ready() -> void:
	for i in 5:
		var text_rect = TextureRect.new()
		text_rect.texture = lifeImage
		$HealthContainer/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
	
func set_health(health):
	for child in $HealthContainer/HBoxContainer.get_children():
		child.queue_free()
		
	for i in health:
		var text_rect = TextureRect.new()
		text_rect.texture = lifeImage
		$HealthContainer/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
		

func _on_score(score):
	$MarginContainer/Score.text = "Score: " + str(score)
