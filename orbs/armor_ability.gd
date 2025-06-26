extends Node2D
class_name ArmorAbility
@onready var cooldown = $Cooldown
@onready var shield_time = $ShieldTimer
@export var cumshield = 1.0
@export var shields = 20.0
@export var enabled := true
@onready var player := get_parent()
@onready var hp := get_parent().get_node("HealthPart")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("useability") and enabled:
		shieldsup()
		shield_time.start()

func shieldsup() -> void:
	enabled = false
	hp.shieldup(cumshield + shields)
	

#yourshield size is diminished cooldown decreased, but accumulates over time

func _on_shield_timer_timeout() -> void:
	hp.removeshield()
	cooldown.start()


func _on_cooldown_timeout() -> void:
	enabled = true
