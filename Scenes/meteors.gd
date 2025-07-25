extends Area2D
var has_collided = false
var speed: int
var rotation_speed : int
var x_direction:float 
signal collision
signal disappear

func _ready():
	
	var rng := RandomNumberGenerator.new()
	var path: String = "res://meteors/"+ str(rng.randi_range(1,7)) + ".png"
	$Meteors.texture = load(path)
	
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range((-width)/2,width/2)	
	var random_y = rng.randi_range(-600,-500)
	position = Vector2(random_x,random_y)
	
	speed = rng.randi_range(500,700)
	x_direction= rng.randf_range(-1,1)
	rotation_speed= rng.randi_range(100,150)
	
func _process(delta):
	position += Vector2(x_direction,1)* speed * delta
	rotation_degrees += rotation_speed* delta


func _on_body_entered(_body: Node2D) -> void:
	collision.emit()
	queue_free()
	


func _on_area_entered(_area: Area2D) -> void:
	_area.queue_free()
	
	queue_free()
	
