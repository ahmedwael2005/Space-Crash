extends CanvasLayer
static var image = load("res://spaceship assets/Lives.png")
var ScoreCounter := 0
func set_health(amount):
	
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
		

		
	for i in  amount:
		var text_rect= TextureRect.new()
		text_rect.texture = image
		
		text_rect.stretch_mode = TextureRect.STRETCH_SCALE
		$MarginContainer2/HBoxContainer.add_child(text_rect)
		


func _on_score_timer_timeout() -> void:
	ScoreCounter +=1
	$MarginContainer/Label.text = str(ScoreCounter)
	Global.score = ScoreCounter
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("exit"):
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
