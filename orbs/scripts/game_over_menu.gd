extends Control
class_name GameOver

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide() # Replace with function body.


func _on_retry_pressed() -> void:
	print("retry")
	get_tree().reload_current_scene() # Replace with function body.


func _on_quit_pressed() -> void:
	print("quit")
	get_tree().quit() # Replace with function body.
