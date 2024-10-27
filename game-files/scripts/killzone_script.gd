extends Area2D

@onready var timer: Timer = $Timer


# Deal damage to player when they collide with killzone.
func _on_body_entered(body: Node2D) -> void:
	body.Player.current_health = deal_damage(body.Player.current_health, 34)
	
	# When player dies, slow down time & start a timer to reset the level
	if body.Player.current_health <= 0:
		Engine.time_scale = 0.25
		timer.start()


# Deal damage to player
func deal_damage(health, damage_amount):
	if (health - damage_amount) <= 0:
		return 0
	else:
		return health - damage_amount


# When timeout, reset game time & level
func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
