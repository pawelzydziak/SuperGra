extends KinematicBody2D

export var star_moving_right = true

const SPEED = 100
const GRAVITY = 10
const CHANGE_TIME = 10


var velocity = Vector2(0, 0)
var moving_right = star_moving_right

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if moving_right:
		velocity.x = SPEED
	else:
		velocity.x = -SPEED
		
	velocity.y += GRAVITY
	
	move_and_slide(velocity)
		
	
	
	
	
