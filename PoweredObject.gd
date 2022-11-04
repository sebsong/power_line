extends Node2D

# set of powered objects this object is connected to
var connections : Global.Set = Global.Set.new()

var has_power : bool = false

func _ready():
	add_to_group("PoweredObjects")
	check_power()

func _process(_delta):
	check_power()

func power_on():
	has_power = true

func power_off():
	has_power = false

func add_connection(connection):
	connections.add(connection)
	# PowerManagement.emit_signal("connections_changed")

func check_power():
	for connection in connections.items():
		if connection.has_power:
			power_on()
			return
	power_off()
