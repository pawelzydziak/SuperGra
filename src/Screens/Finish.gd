extends Node2D

export(String, FILE) var next = ""
func _on_Button_button_up():
	PlayerVars.playerPoints = 0
	get_tree().change_scene(next)

