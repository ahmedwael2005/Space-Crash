extends CanvasLayer



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		get_tree().change_scene_to_file("res://Scenes/world.tscn")
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
