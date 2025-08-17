extends Area2D

var speed: int
var direction_x: float
signal collision
signal explosion


func _ready() -> void:
	var rng:= RandomNumberGenerator.new()
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	
	speed = rng.randi_range(100, 500)
	direction_x = rng.randi_range(-1, 1)
	position = Vector2(random_x, random_y)
	
func _process(delta: float) -> void:
	position += Vector2(direction_x, 1) * speed * delta
	
func _on_body_entered(body: Node2D) -> void:
	queue_free()
	collision.emit()

func _on_area_entered(area: Area2D) -> void:
	Global.score += 1
	explosion.emit()
	get_tree().call_group("ui","_on_score", Global.score)
	area.queue_free()
	queue_free()
