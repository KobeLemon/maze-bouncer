extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

const DEFAULT_LOCATION := Vector2(-43, 12)

const Character = preload("res://scripts/character_class_script.gd")
var Player = Character.new()

var is_slamming: bool = false
var is_dashing: bool = false
var start_playing: bool = false

func _physics_process(delta: float) -> void:
	
	if Input.is_anything_pressed():
		start_playing = true
		animated_sprite.play("bounce")
		
	if start_playing:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# If the player collides with the floor, bounce up
		if is_on_floor():
			velocity.y = Player.jump_velocity

		# Get the input direction and handle the side to side movement.
		var direction := Input.get_axis("move_left", "move_right")
		
		# Flip the Sprite
		if direction > 0:
			animated_sprite.flip_h = false
		elif direction < 0:
			animated_sprite.flip_h = true
		
		# Apply Movement
		if direction:
			velocity.x = direction * Player.speed
		else:
			velocity.x = move_toward(velocity.x, 0, Player.speed)
		
		# Slam down when player presses the down key to jump higher
		if not is_on_floor() and Input.is_action_just_pressed("move_down"):
			velocity += get_gravity() * 20 * delta
			is_slamming = true
		if is_on_floor() and is_slamming:
			velocity.y = Player.jump_velocity * 1.3
			is_slamming = false
			

		# DEBUG -- REMOVE IN LIVE RELEASE
		#if Input.is_action_just_pressed("jump") or Input.is_action_pressed("jump"):
			#velocity.y = Player.jump_velocity

		move_and_slide()
