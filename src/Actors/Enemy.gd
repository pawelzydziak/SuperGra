extends "res://src/Actors/Actor.gd"

func _ready() -> void:
	set_physics_process(false) #ze nie działa jak nie widac
	_velocity.x = -speed.x

func _on_KillerDet_body_entered(body: PhysicsBody2D) -> void:
	#nizej niz detektor
	if body.global_position.y > get_node("KillerDet").global_position.y:
		return
	queue_free()

func _physics_process(delta: float) -> void:
	_velocity.y = gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y


