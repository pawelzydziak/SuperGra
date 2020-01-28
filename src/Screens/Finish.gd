extends Node2D

export(String, FILE) var next = ""
func _on_Button_button_up():
	get_tree().change_scene(next)
