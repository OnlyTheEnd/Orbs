extends Node2D
class_name HealthNode
@export var MAX := 10.0
var health : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = MAX# Replace with function body.

func damage(attack):
	health -= attack
	if health <= 0:
		get_parent().queue_free()


func _on_damage_node_area_entered(area: Area2D) -> void:
	print("ping")
	damage(1) # Replace with function body.
