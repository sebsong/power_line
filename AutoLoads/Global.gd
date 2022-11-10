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
	
	func size():
		return dict.size()

var player : Node

# Assumes there is a "Sprite" node nested under the given node, attempts to resize "CollisionShape2D" if available
func resize_kinematic_body(node, target_width : float, target_height : float) -> void:
	var sprite_node = node.get_node("Sprite")
	resize_sprite(sprite_node, target_width, target_height)

	var collision_shape_node = node.get_node_or_null("CollisionShape2D")
	resize_collision_shape(collision_shape_node, target_width, target_height)

func get_sprite_size(sprite_node):
	if sprite_node.has_method("get_texture"):
		return sprite_node.get_texture().get_size()
	else:
		# assume it's an animated sprite
		return sprite_node.frames.get_frame("default", 0).get_size()
			
func resize_sprite(sprite_node, target_width : float, target_height : float) -> void:
	var size : Vector2 = get_sprite_size(sprite_node)
	var x_scale = target_width / size.x
	var y_scale = target_height / size.y

	sprite_node.scale = Vector2(x_scale, y_scale)

func resize_collision_shape(collision_shape_node, target_width : float, target_height : float) -> void:
	if collision_shape_node != null:
		if collision_shape_node.shape is CircleShape2D:
			collision_shape_node.shape.radius = target_width / 2
		elif collision_shape_node.shape is RectangleShape2D:
			collision_shape_node.shape.extent.x = target_width
			collision_shape_node.shape.extent.y = target_height
