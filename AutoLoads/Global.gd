extends Node

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

var player : Node
