extends CharacterBody2D

##### THIS FILE IS A GENERIC CHARACTER CLASS #####
#####   IT IS INHERITED BY PLAYER & ENEMIES  #####

# Movement
var speed: float = 125.0
var jump_velocity: float = -225.0
var dash_speed: float = speed * 10.0
var dash_length: float = 0.5

# Health
var max_health: float = 100.0
var current_health: float = max_health

# Damage
var damage_output: float = 25.0

# Level/XP
var current_level: float = 1.0
var current_XP: float = 0.0

# Base Inventory
var inventory : Dictionary = {
	"money": 0,
	"main_weapon": {"id": 26, "name": "Iron Sword", "damage": 10.0},
	"offhand": {"id": 5, "name": "Iron Shield", "defense": 10.0},
	"healing_potions": [
		{"id": 34, "name": "Average Healing Potion", "healing_amount": 10.0, "count": 1},
		{"id": 31, "name": "Major Healing Potion", "healing_amount": 10.0, "count": 1},
	],
	"weapons_bag": [
		{"id": 75, "name": "Rusty Dagger", "damage": 5.0, "damage_type": ["slashing", "poison"], "wield_type": "main_weapon", "effect": {"id": 36, "effect_type": "rust_poison", "effect_damage": 5}},
		{"id": 12, "name": "Wooden Shield", "defense": 5.0, "damage_type": null, "wield_type": "offhand", "effect": null},
		{"id": 65, "name": "Steel Bow", "damage": 20.0, "damage_type": ["ranged",], "wield_type": "main_weapon", "effect": null},
		{"id": 89, "name": "Broken Axe", "damage": 10, "damage_type": ["cutting",], "wield_type": "main_and_offhand", "effect": null}
	]
}
