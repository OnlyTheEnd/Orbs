extends Node2D

@onready var Proj = preload("res://scenes/projectile.tscn")
var time_start := 0
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	get_tree().paused = false
	time_start = Time.get_ticks_msec()


var elapsed_time := 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spawnproj()
	elapsed_time = (Time.get_ticks_msec() - time_start) / 1000
	$CanvasLayer/Tims.text = str(elapsed_time)



var high_score :int = 0

var player_health :int


func spawnproj():
	if Input.is_action_just_pressed("summon bullet"):
		var proj = Proj.instantiate()
		var loc = get_node("Player").projloc()
		proj.target = get_node("Player")
		proj.look(get_node("Player/Sprite2D").global_position)
		proj.position = loc
		get_tree().current_scene.add_child(proj)


func _on_player_tree_exiting() -> void:
	get_tree().paused = true
	get_node("CanvasLayer/GameOverMenu").show() 
