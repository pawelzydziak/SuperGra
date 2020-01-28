extends Area2D

export var next_scene: PackedScene

onready var animation_player = $AnimationPlayer

func _on_magicTeleport_body_entered(body: PhysicsBody2D) -> void:
	teleport()

func teleport() -> void:
	animation_player.play("fade")
	yield(animation_player, "animation_finished")
	get_tree().change_scene_to(next_scene)
	

