extends CharacterBody2D

##### THIS FILE IS A GENERIC CHARACTER CLASS #####
#####   IT IS INHERITED BY PLAYER & ENEMIES  #####

# Movement
var speed = 150.0
var jump_velocity = -225.0
var dash_speed = speed * 10.0
var dash_length = 0.5

# Health
var max_health = 100.0
var current_health = max_health

# Damage
var damage_output = 10.0

# Level/XP
var current_level = 1.0
var current_XP = 0.0

# Money
var money = 0
