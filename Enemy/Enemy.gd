extends Node2D

const DEFAULT_ENEMY_SIZE = 50

var health : int

func _ready():
	add_to_group("Enemies")

func _process(delta):
	if health <= 0:
		die()

func take_damage(damage : int):
	health -= damage

func die():
	visible = false