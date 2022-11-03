extends KinematicBody2D

const POWER_NODE_SCENE : PackedScene = preload("res://Scenes/PowerNode.tscn")

var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)
	power_node_placement()

func move(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= speed * delta
	if Input.is_action_pressed("ui_down"):
		position.y += speed * delta
	if Input.is_action_pressed("ui_left"):
		position.x -= speed * delta
	if Input.is_action_pressed("ui_right"):
		position.x += speed * delta
	
func power_node_placement():
	if Input.is_action_just_pressed("place_power_node"):
		var power_node : Node = POWER_NODE_SCENE.instance()
		power_node.position = position
		get_parent().add_child(power_node)
