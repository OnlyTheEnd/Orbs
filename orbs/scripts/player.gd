extends CharacterBody2D
class_name Player

@export var SPEED = 300.0
const iniSPEED = 300.0
@onready var healthpart = $HealthPart
@onready var camera = $Camera2D


#AbilityDict
var ABILITIES : Dictionary = {
	"dash" : preload("res://scenes/abilities/dash_ability.tscn"),
	"armor" : preload("res://scenes/abilities/armor_ability.tscn")
}

func _ready() -> void:
	#for ability in abilities.ability_enabled:
		#if ability in ABILITIES.keys():
			#var playerability = ABILITIES[abilities].instantiate()
			#add_child(playerability)
	if GameConfig.ability_enabled != "none":
		var playerability = ABILITIES[GameConfig.ability_enabled].instantiate()
		add_child(playerability)
	setcamlimit()

#hell mode movement: hold space for accelerationposition

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * SPEED
	
	

#ability to warp through walls
func wrap_screen():
	var screen = get_viewport_rect().size
	if position.x < 0:
		position.x = screen.x
	if position.x > screen.x:
		position.x = 0
	if position.y < 0:
		position.y = screen.y
	if position.y > screen.y:
		position.y = 0 


func _physics_process(delta):
	get_input()
	move_and_slide()
	var collision = move_and_collide(velocity * delta)
	#var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	#if collision:
		#var reflect = collision.get_remainder().bounce(collision.get_normal())
		#velocity = velocity.bounce(collision.get_normal()) * 100
		#move_and_collide(reflect)

#set boundarys to that of the arena
func setcamlimit() -> void:
	camera.limit_left = 0
	camera.limit_right = get_viewport_rect().size.x
	camera.limit_top = 0
	camera.limit_bottom = get_viewport_rect().size.y

#on damage taken effects: reduce speed, size and FOV
func _on_health_part_onhealthchanged() -> void:
	var scales = healthpart.scaleratio()
	SPEED = iniSPEED * scales
	scale = Vector2(scales, scales)
	camera.zoom = Vector2(1/scales, 1/scales)
