extends "res://Enemy/Enemy.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_health(100)
	Global.resize_kinematic_body($KinematicBody2D, DEFAULT_ENEMY_SIZE, DEFAULT_ENEMY_SIZE)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
