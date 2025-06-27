extends Control

@export var StartGame : PackedScene

func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/UI/game_start.tscn")



func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_shield_toggled(toggled_on: bool) -> void:
	if toggled_on:
		GameConfig.ability_enabled = "shield"
	else:
		GameConfig.ability_enabled = "none"

func _on_dash_toggled(toggled_on: bool) -> void:
	if toggled_on:
		GameConfig.ability_enabled = "dash"
	else:
		GameConfig.ability_enabled = "none"
