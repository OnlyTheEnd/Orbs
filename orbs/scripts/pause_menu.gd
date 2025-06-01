extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()




func pause():
	get_tree().paused = true
	show()
	$AnimationPlayer.play("new_animation")

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("new_animation")
	hide()
	
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
	resume()
	get_tree().change_scene_to_file("res://scenes/1root.tscn")


func _on_test_3_pressed() -> void:
	get_tree().quit()

func _process(_delta):
	pausemenu()
