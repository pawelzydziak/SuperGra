extends KinematicBody2D

const GRAVITY = 100
var velocity = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	velocity = velocity.linear_interpolate(movePlayer(), delta * 1)
	print(velocity)
	velocity.y += GRAVITY
#	velocity = Vector2(0, GRAVITY)
#	movePlayer()
	move_and_slide(velocity, Vector2.UP)
	

func movePlayer():
	var dir = Vector2(0,0)
	if Input.is_action_pressed("ui_left"):
		dir.x = -100
	if Input.is_action_pressed("ui_right"):
		dir.x = 100
	if Input.is_action_pressed("ui_up"):
		dir.y -= (GRAVITY + 100)
#	if is_on_floor():
#		if Input.is_action_pressed("ui_up"):
#			dir.y = -1000
	return dir
