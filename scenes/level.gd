extends Node2D

var enemy_scene: PackedScene = load("res://scenes/enemy.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")
var health: = 5

func _ready() -> void:
	$GamePlaySound.play()
	
func _on_enemy_spawn_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	$Enemies.add_child(enemy)
	enemy.connect('collision', _on_enemy_collision)
	enemy.connect('explosion', _on_enemy_explosion)
	
func _on_enemy_collision():
	health -= 1
	$DamageSound.play()
	get_tree().call_group('ui', 'set_health', health)
	if(health <=0):
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func _on_player_laser(pos: Variant) -> void:
	var laser_bullet = laser_scene.instantiate()
	$Lasers.add_child(laser_bullet)
	laser_bullet.position = pos
	
func _on_enemy_explosion():
	$EnemyExplosion.play()


func _on_game_play_sound_finished() -> void:
	$GamePlaySound.play() 
