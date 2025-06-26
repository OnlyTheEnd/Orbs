extends Projectile
class_name Red


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()

func _physics_process(delta: float) -> void:
	global_position += direction * speed * delta
