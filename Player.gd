extends KinematicBody2D

const SPEED = 200
const GRAVITY = 10
const JUMP_POWER = -250

onready var animation_player = $AnimationPlayer
onready var player_sprite = $Minotaur

var velocity = Vector2(0, 0)

func _process(delta):
	if Input.is_action_pressed("MoveRight"):
		velocity.x = SPEED
		animation_player.play("Run")
		player_sprite.flip_h = false
	elif Input.is_action_pressed("MoveLeft"):
		velocity.x = -SPEED
		animation_player.play("Run")
		player_sprite.flip_h = true
	elif Input.is_action_pressed("Attack"):
		animation_player.play("Attack")
	elif Input.is_action_pressed("Special"):
		animation_player.play("SpecialAttack")
	else:
		velocity.x = 0
		animation_player.play("Idle")

	if is_on_floor() and Input.is_action_just_pressed("Jump"):
		velocity.y = JUMP_POWER
		
	velocity.y += GRAVITY
	
	move_and_slide(velocity, Vector2.UP)
