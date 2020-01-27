extends Control

func _ready():
	get_node("PauseOverlay").visible = false


func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = not get_tree().paused
		get_node("PauseOverlay").visible = not get_node("PauseOverlay").visible
