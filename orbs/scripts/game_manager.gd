extends Node2D


@onready var pool = $ProjectilePool
@onready var path = $Spawning/test
@onready var player = $Player
@onready var projtimer = $Timer

var time_start := 0




func _ready() -> void:
	
	get_tree().paused = false
	time_start = Time.get_ticks_msec()

var elapsed_time := 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	elapsed_time = (Time.get_ticks_msec() - time_start) / 1000
	$"UI stuff/Score".text = str(elapsed_time)

var high_score :int = 0


#aimed player proj
func spawnproj():
		var proj = pool.get_randomproj()
		var loc = randomloc()
		proj.aim(loc, player.global_position)

func randomloc() -> Vector2:
	path.progress_ratio = randf_range(0, 1)
	return path.global_position

#player death
func _on_player_tree_exiting() -> void:
	get_tree().paused = true
	get_node("UI stuff/GameOverMenu").show() 

#func spawn_circle(start: Vector2, count: int):
	#var proj = pool.get_proj("red")
	#for i in count:
		#var angle = TAU * i / count
		#var dir = Vector2.RIGHT.rotated(angle)
		#proj.aim(start, dir)

func _on_timer_timeout() -> void:
	spawnproj()


#func _on_circle_timer_timeout() -> void:
	#spawn_circle(randomloc(), 10)

#increase difficulty over time
func _on_hardertimer_timeout() -> void:
	projtimer.wait_time -= 0.1
