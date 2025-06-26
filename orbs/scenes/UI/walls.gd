extends Node2D

var WALL_SIZE := Vector2(0,0)
var Walls = preload("res://scenes/GameElements/wall_segment.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	WALL_SIZE = $WallSegment.get_size()
	build_wall_border()
	print(WALL_SIZE)
	print("test")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func build_wall_border():
	var screen_size = get_viewport_rect().size
	var cols = int(ceil(screen_size.x / WALL_SIZE.x))
	var rows = int(ceil(screen_size.y / WALL_SIZE.y))
	
	for x in range(cols + 1):
		for y in range(rows + 1):
			if (x == 0 || x == cols || y == 0 || y == rows):
				spawn_wall(Vector2(WALL_SIZE.x * x, WALL_SIZE.y * y))

func spawn_wall(pos:Vector2):
	var wall = Walls.instantiate()
	wall.position = pos
	add_child(wall)
