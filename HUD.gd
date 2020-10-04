extends CanvasLayer


signal start_game # Tell the Main node that the button has benn pressed


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called when we want to display a message temporarily, such as "Get Ready"
func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()


# This function is called when the player loses. It'll show "Game Over" for 2 seconds
# then return to title screen, after a brief pause, show the "Start" button
func show_game_over():
	show_message("Game Over")
	
	yield($MessageTimer, "timeout") # Wait until the MessageTimer has counted down.
	
	$Message.text = "Dodge the\nCreeps!"
	$Message.show()
	
	# Make a one-shot timer and wait for it to finish
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()


# Called by Main when the score changes
func update_score(score):
	$ScoreLabel.text = str(score)

func _on_MessageTimer_timeout():
	$Message.hide()


func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
