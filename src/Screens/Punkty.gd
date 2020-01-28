extends Label

func _ready():
	set_process_input(true)
	
func _input(event):
	self.set_text("Punkty: " +str(PlayerVars.playerPoints))