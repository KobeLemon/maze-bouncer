extends Node

var score = 0

@onready var coins_label: Label = %Coins_Label
@onready var score_label: Label = %Score

# Add point to player's score & display the score
func add_point():
	score += 1
	score_label.text = "You have collected " + str(score) + " coins!"
