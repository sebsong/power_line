extends Node

# NOTE: this approach is very slow, maybe port this to cpp and multithread?

# signal connections_changed

# func _ready():
# 	connect("connect_changed", self, "on_connectionsChanged")

# func propagate_power():
# 	var seen = Global.Set.new()
# 	var queue = []

# 	# start propagation from power sources
# 	for power_source in get_tree().get_nodes_in_group("PowerSources"):
# 		queue.append(power_source)
	
# 	# BFS propagate power
# 	while not queue.empty():
# 		var node = queue.pop_front()
# 		node.power_on()
# 		seen.add(node)
# 		for connection in node.connections.items():
# 			if not seen.has(connection):
# 				queue.push_back(connection)
	
# 	# power off any nodes not connected to power sources
# 	for powered_object in get_tree().get_nodes_in_group("PoweredObjects"):
# 		if not seen.has(powered_object):
# 			powered_object.power_off()

# func on_connectionsChanged():
# 	propagate_power()
