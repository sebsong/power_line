extends Node2D

class Set:
	var dict : Dictionary

	func Set():
		dict = Dictionary()

	func add(item):
		dict[item] = null

	func remove(item):
		dict.erase(item)
	
	func has(item):
		return dict.has(item)

	func items():
		return dict.keys()

# set of powered objects this object is connected to
var connections : Set = Set.new()

var has_power : bool = false

func _ready():
	check_power()

func _process(_delta):
	check_power()

func add_connection(connection):
	connections.add(connection)

func check_power():
	for connection in connections.items():
		if connection.has_power:
			has_power = true
			return
	has_power = false
