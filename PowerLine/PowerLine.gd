extends "res://PoweredObject.gd"

const POWERED_COLOR : Color = Color("6680ff")
const UNPOWERED_COLOR : Color = Color.black

# Called when the node enters the scene tree for the first time.
func _ready():
	update_color()
	for node in connections.items():
		$Line.add_point(node.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# ._process(_delta)
	update_color()


func update_color():
	if has_power:
		$Line.default_color = POWERED_COLOR
	else:
		$Line.default_color = UNPOWERED_COLOR

# should set connection before adding to scene tree
func connect_nodes(node, other_node):
	add_connection(node)
	add_connection(other_node)
	node.add_connection(other_node)
	other_node.add_connection(node)
