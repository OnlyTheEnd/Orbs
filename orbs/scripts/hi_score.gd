extends Label

@export var high_score:= 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func set_score(value) -> void:
	$HiScore.text = "HiScore: " + str(value)
