extends Projectile
class_name Rock

#collsion layer 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super() 

func _physics_process(delta: float) -> void:
	global_position = global_position.move_toward(target, speed * delta)
