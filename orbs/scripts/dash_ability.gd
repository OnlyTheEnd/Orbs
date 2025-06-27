extends Node2D
class_name DashAbility
@onready var cooldown = $Cooldown
@onready var dash_time := $DashTimer
@export var dash_speed := 800.0
@export var invincible_duration := 0.2
@export var enabled := true
@onready var player := get_parent()
@onready var hurtbox := get_parent().get_node("HurtboxPart")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("useability") and enabled:
		start_dash()
		dash_time.start()



func start_dash():
	enabled = false
	hurtbox.monitoring = false
	player.SPEED = player.SPEED * 3
	
	
func end_dash():
	hurtbox.monitoring = true
	player.SPEED = player.SPEED/3
	cooldown.start()


func _on_dash_timer_timeout() -> void:
	end_dash()


func _on_cooldown_timeout() -> void:
	enabled = true
