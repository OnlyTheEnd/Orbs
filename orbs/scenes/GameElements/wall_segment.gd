extends StaticBody2D
class_name WallSegment

var height := 32.0
var width := 32.0
# Called when the node enters the scene tree for the first time.
var ideal := Vector2(height, width)


func _ready() -> void:
	$Collider.shape.size = ideal
	$Sprite2D.scale = ideal / $Sprite2D.texture.get_size()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_size() -> Vector2:
	return ideal
