extends Area2D

onready var animation_player: AnimationPlayer = $AnimationPlayer 

func _on_Coin_body_entered(body: PhysicsBody2D) -> void:
	animation_player.play("fade")
	PlayerVars.playerPoints += 100
	queue_free()
	print(PlayerVars.playerPoints)
