extends Actor

export var stomp_impulse = 600.0
export(String, FILE) var nextScene = ""

func _on_EnemyDet_area_entered(area: Area2D) -> void:
	_velocity = calc_stomp_velocity(_velocity, stomp_impulse)

func _on_EnemyDet_body_entered(body: PhysicsBody2D) -> void:
	queue_free()
	get_tree().change_scene(nextScene)

func _physics_process(delta: float) -> void:
	var is_jump_interrupted = Input.is_action_just_released("Jump") and _velocity.y < 0.0
	var dir = get_dir()
	_velocity = calc_velocity(_velocity, speed, dir, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	
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

func calc_stomp_velocity(velo: Vector2, impulse: float) -> Vector2:
	var out = velo
	out.y = -impulse
	return out


