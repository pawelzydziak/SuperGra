extends PathFollow2D

var enemyLocation = 0
export var enemySpeed = 0.005

onready var enemy = $Zombie
onready var sprite = $Zombie/zombie_male
onready var enemy_x = enemy.global_position[0]
onready var enemy_start_x = enemy.global_position[0]


func _process(delta):
	set_unit_offset(enemyLocation)
	
	var diff = enemy.global_position[0] - enemy_x
	enemy_x = enemy.global_position[0] 
	print(diff > 0)
	if diff > 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true

	enemyLocation += enemySpeed
