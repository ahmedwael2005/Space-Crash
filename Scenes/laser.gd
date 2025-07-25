extends Area2D 

@export var speed =1200

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= speed*delta
	



	
	
