extends Node2D
class_name Projectile

@export var speed = 1000
var target : Player
var targetloc : Vector2
@export var damage: int



func look(pos : Vector2) -> void:
	targetloc = pos
	look_at(targetloc)

#move forward
func _physics_process(delta: float) -> void:
	position = position.move_toward(targetloc, speed * delta)


func _on_timer_timeout() -> void:
	queue_free() # Replace with function body.


#func _on_area_2d_area_entered(area: Area2D) -> void:
	#queue_free()
