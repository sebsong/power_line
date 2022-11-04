extends KinematicBody2D

const POWER_NODE_SCENE : PackedScene = preload("res://Scenes/PowerNode.tscn")

var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.player = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)
	power_node_placement()

func move(delta):
	if Input.is_action_pressed("ui_up"):
		move_and_slide(Vector2(0, -speed))
	if Input.is_action_pressed("ui_down"):
		move_and_slide(Vector2(0, speed))
	if Input.is_action_pressed("ui_left"):
		move_and_slide(Vector2(-speed, 0))
	if Input.is_action_pressed("ui_right"):
		move_and_slide(Vector2(speed, 0))
	
func power_node_placement():
	if Input.is_action_just_pressed("place_power_node"):
		var power_node : Node = POWER_NODE_SCENE.instance()
		power_node.position = position
		get_parent().add_child(power_node)
