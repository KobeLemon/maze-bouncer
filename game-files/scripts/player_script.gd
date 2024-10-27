extends CharacterBody2D

# Imports
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

const Character = preload("res://scripts/character_class_script.gd")
var Player = Character.new()

var default_location := Vector2(-393, -433)
var is_slamming: bool = false
var is_dashing: bool = false
var start_playing: bool = false
var took_damage: bool = false

# Play the idle animation upon start
func _ready() -> void:
	animated_sprite.play("idle")

# Handle all physics. This runs on every frame
func _physics_process(delta: float) -> void:

	if not start_playing:
		if Input.is_anything_pressed():
			start_playing = true

	else:
		animated_sprite.play("bounce")

		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# If the player collides with the floor, bounce up
		if is_on_floor():
			velocity.y = Player.jump_velocity

		# When player dies, stop the animation & flip upside down
		if Player.current_health <= 0:
			animated_sprite.stop()
			animated_sprite.flip_v = true
		
		else:
			# Get the input direction and handle the side to side movement.
			var direction := Input.get_axis("move_left", "move_right")
			
			# Flip the Sprite when moving side to side
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
				

		move_and_slide()
