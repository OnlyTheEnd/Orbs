extends Node2D
@export var red: PackedScene
@export var rock: PackedScene

@export var types: Dictionary = {
	"red" : preload("res://scenes/GameElements/red_projectile.tscn"),
	"rock" : preload("res://scenes/GameElements/rock_projectile.tscn")
}

@export var poolsize : int
# Called when the node enters the scene tree for the first time.
var pool := {}

func _ready() -> void:
	_initialisepool()


func _initialisepool()-> void:
	for type in types.keys():
		pool[type] = []
		for i in range(poolsize) :
			var proj = types[type].instantiate()
			pool[type].append(proj)
			add_child(proj)
# Called every frame. 'delta' is the elapsed time since the previous frame.

func get_proj(type: String) -> Projectile:
	for proj in pool.get(type):
		if proj.visible == false:
			return proj
	return null

func get_randomproj() -> Projectile:
	var rand = pool.keys()[randi() % types.size()]
	return get_proj(rand)

func _process(delta: float) -> void:
	pass
