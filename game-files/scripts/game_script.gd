extends Node

var health := 100.0


# Calculate damage done to the player
func _take_damage(amount):
	if (health - amount) <= 0.0: # health: 0 or less
		health = 0
		print("You died!")
		return
	else:
		health -= amount
	
	# range(...) is low-inclusive but NOT top-inclusive,
	#   so the actual range is 1 less than range(...)'s max
	if health > 60.0: # health: 60+
		print("You are healthy!")
		return
	elif health in range(31.0, 61.0): # health: 31-60
		print("You are injured!")
		return
	elif health in range(1.0, 31.0): # health: 1-30
		print("You are badly hurt!")
		
