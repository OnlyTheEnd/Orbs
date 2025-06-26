extends Node2D
class_name Projectile

@onready var hurtbox = $HurtboxPart
@export var speed = 1000
var target : Vector2
var direction : Vector2
@export var damage: int
@onready var timer = $Timer

signal repool

func _ready() -> void:
	hurtbox.damage = damage
	hide()
	set_physics_process(false)

func aim(pos: Vector2, targetloc : Vector2) -> void:
	position = pos
	target = targetloc
	direction = (target - pos).normalized()
	look_at(target)
	show()
	set_physics_process(true)
	timer.start()

#shoot
func _physics_process(delta: float) -> void:
	pass #insert movement pattern



func _on_timer_timeout() -> void:
	deactivate()



func deactivate() -> void:
	hide() # Replace with function body.
	set_physics_process(false)
	emit_signal("repool")
#func _on_area_2d_area_entered(area: Area2D) -> void:
	#queue_free()


func _on_hurtbox_part_body_entered(body: Node2D) -> void:
	if body is StaticBody2D :
		deactivate() # Replace with function body.
	
