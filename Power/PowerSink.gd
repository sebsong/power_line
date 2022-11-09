extends "res://Power/PowerNode/PowerNode.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("PowerSinks")

# func check_power():
	# power sinks should not propagate power
	# power_off()
