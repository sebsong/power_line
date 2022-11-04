extends "res://PowerNode/PowerNode.gd"

func _ready():
	add_to_group("PowerSources")

func check_power():
	power_on()
