extends Node2D
class_name Projectile

@export var speed = 1000
@export var target = Player

var damage: int
func setspawn() :
	pass
	#self.position = 
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	position += transform.x * (speed * delta)


func _on_timer_timeout() -> void:
	queue_free() # Replace with function body.


func _on_area_2d_area_entered(area: Area2D) -> void:
	queue_free()
