extends Node2D

const Character = preload("res://scripts/character_class_script.gd")
var Enemy = Character.new()

Enemy.speed = 30

var direction = 1

@onready var raycast_right_straight = $RayCast_Right_Straight
@onready var raycast_left_straight = $RayCast_Left_Straight
@onready var raycast_right_cliff = $RayCast_Right_Cliff
@onready var raycast_left_cliff = $RayCast_Left_Cliff
@onready var animated_sprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    # Right side: if enemy hits a wall or would hit a cliff, flip & go left
    if raycast_right_straight.is_colliding() or not raycast_right_cliff.is_colliding:
        direction = -1
        animated_sprite.flip_h = true
    # Right side: if enemy hits a wall or would hit a cliff, flip & go left
    if raycast_left_straight.is_colliding() or not raycast_left_cliff.is_colliding:
        direction = 1
        animated_sprite.flip_h = false

    position.x += direction * Enemy.speed * delta

