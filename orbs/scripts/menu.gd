extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func pause():
	get_tree().paused = true
	$AnimationPlayer.play("new_animation")

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("new_animation")
	
func pausemenu():
	if Input.is_action_just_pressed("pause menu"):
		print(get_tree().paused)
		if get_tree().paused:
			resume()
		else:
			pause()

func _on_test_pressed() -> void:
	resume()


func _on_test_2_pressed() -> void:
	get_tree().reload_current_scene()


func _on_test_3_pressed() -> void:
	get_tree().quit()

func _process(_delta):
	pausemenu()
