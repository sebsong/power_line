extends "res://PoweredObject.gd"

const POWER_LINE_SCENE : PackedScene = preload("res://Scenes/PowerLine.tscn")
const RANGE_LINE_SCENE : PackedScene = preload("res://Scenes/RangeLine.tscn")

const POWERED_MODULATE : Color = Color.white
const UNPOWERED_MODULATE : Color = Color("505050")

var connection_radius = 300
var range_line : Node = null

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("PowerNodes")
	update_color()
	connect_to_power_nodes_in_range()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# ._process(_delta)
	update_color()
	connect_range_lines_to_player()

func connect_to_power_nodes_in_range():
	for power_node in get_tree().get_nodes_in_group("PowerNodes"):
		if power_node == self:
			continue
		var distance_to_node = (power_node.position - position).length()
		if distance_to_node <= connection_radius:
			# node is in range
			var power_line = POWER_LINE_SCENE.instance()
			power_line.connect_nodes(self, power_node)
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

func update_color():
	var sprite = $KinematicBody.get_node("Sprite")
	if has_power:
		sprite.modulate = POWERED_MODULATE
	else:
		sprite.modulate = UNPOWERED_MODULATE
