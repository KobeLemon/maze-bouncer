extends Area2D

@onready var game_manager = %Game_Manager
@onready var animation_player = $Animation_Player
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta: float) -> void:
	animated_sprite.play("spin")


func _on_body_entered(body):
	game_manager.add_point()
	animation_player.play("pickup")
