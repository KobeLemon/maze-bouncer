extends Area2D

@onready var game_manager: Node = %Game_Manager
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Heal character & add 1 point to score when player collides with a coin
func _on_body_entered(body: Node2D) -> void:
	# Heal player 2HP for every coin collected
	if (body.Player.current_health + 2) >= body.Player.max_health:
		body.Player.current_health = body.Player.max_health
	else:
		body.Player.current_health += 2

	game_manager.add_point()
	animation_player.play("pickup")
