extends KinematicBody2D

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

const POWER_LINE_SCENE : PackedScene = preload("res://Scenes/PowerLine.tscn")
const RANGE_LINE_SCENE : PackedScene = preload("res://Scenes/RangeLine.tscn")

var connection_radius = 300
var connected_nodes : Set = Set.new()
var range_line : Node = null

# Called when the node enters the scene tree for the first time.
func _ready():
	connect_power_nodes_in_range()
	connect_power_lines_to_nodes()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	connect_range_lines_to_player()

func connect_power_nodes_in_range():
	for power_node in get_tree().get_nodes_in_group("PowerNodes"):
		var distance_to_node = (power_node.position - position).length()
		if distance_to_node <= connection_radius:
			# power node is in range
			connect_power_node(power_node)
			# power_node.connect_power_node(self)

func connect_power_lines_to_nodes():
	for node in connected_nodes.items():
		var power_line = POWER_LINE_SCENE.instance()
		power_line.add_point(position)
		power_line.add_point(node.position)
		get_parent().add_child(power_line)

func connect_range_lines_to_player():
	var player_position = Global.player.position
	var distance_to_player = (player_position - position).length()
	if distance_to_player <= connection_radius:
		if range_line == null:
			range_line = RANGE_LINE_SCENE.instance()
			range_line.add_point(position)
			range_line.add_point(player_position)
			get_parent().add_child(range_line)
		range_line.set_point_position(0, position)
		range_line.set_point_position(1, player_position)
	else:
		if range_line != null:
			range_line.queue_free()
			range_line = null


func connect_power_node(node):
	connected_nodes.add(node)
