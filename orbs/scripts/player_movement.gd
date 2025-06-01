extends CharacterBody2D
class_name Player

const SPEED = 300.0
#const JUMP_VELOCITY = -400.0


#func _physics_process(delta: float) -> void:
	## Add the gravity.
	##if not is_on_floor():
		##velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
	#

#hell mode movement: hold space for accelerationposition
func projloc() -> Vector2:
	get_node("Spawning/test").progress_ratio = randf_range(0, 1)
	return get_node("Spawning/test").global_position 

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * SPEED
	
	

func _physics_process(delta):
	
	get_input()
	move_and_slide()
	
