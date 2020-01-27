extends PathFollow2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var enemyLocation = 0
export var enemySpeed = 0.005

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_unit_offset(enemyLocation)
	print(offset)
	if(enemyLocation):
		get_node("Zombie/zombie_male").flip_h = true
	else:
		get_node("Zombie/zombie_male").flip_h = false
		
	enemyLocation += enemySpeed
#	print(unit_offset)