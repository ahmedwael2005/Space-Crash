extends Node2D
#load

var meteor_scene: PackedScene = load("res://Scenes/meteors.tscn")
var laser_scene: PackedScene= load("res://Scenes/laser.tscn")
var health: int = 3
func _ready():
	get_tree().call_group('ui','set_health', health)
func _on_meteor_timer_timeout() -> void:
	#intiate
	var meteor = meteor_scene.instantiate()
	
	$Meteors.add_child(meteor)
	meteor.connect('collision',on_meteor_collision)

func on_meteor_collision():
	health -= 1
	get_tree().call_group('ui','set_health', health)
	if health <=0:
		get_tree().change_scene_to_file.call_deferred("res://Scenes/game_over.tscn")
		



func _on_player_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	laser.position = pos
	$Lasers.add_child(laser)

	
