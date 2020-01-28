extends Actor

func _physics_process(delta: float) -> void:
	var is_jump_interrupted = Input.is_action_just_released("Jump") and velocity.y < 0.0
	var dir = get_dir()
	velocity = calc_velocity(velocity, speed, dir, is_jump_interrupted)
	velocity = move_and_slide(velocity, FLOOR_NORMAL)
	
func get_dir() -> Vector2:
	return  Vector2(
	Input.get_action_strength("MoveRight") - Input.get_action_strength("MoveLeft"), 
	-1.0 if Input.is_action_just_pressed("Jump") and is_on_floor() else 1.0
	)
	
	
func calc_velocity(velo: Vector2, speed: Vector2, dir: Vector2, jump_interrupt: bool) -> Vector2:
	var new_velo = velo
	new_velo.x = speed.x * dir.x
	new_velo.y += gravity * get_physics_process_delta_time()
	#skok
	if dir.y == -1:
		 new_velo.y = speed.y * dir.y
	if (jump_interrupt):
		new_velo.y = 0.0
	return new_velo