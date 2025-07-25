extends CharacterBody2D

@export var speed: int = 500
var can_shoot: bool = true
signal laser(pos)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = Input.get_vector("Left","Right","Up","Down")
	velocity = direction * speed
	move_and_slide()

#shoot input
	if Input.is_action_just_pressed("shoot") and can_shoot:
		laser.emit($LaserStartPosition.global_position- Vector2(0,-100))
		can_shoot = false
		$laserTimer.start()

func _on_laser_timer_timeout() -> void:
	can_shoot = true
