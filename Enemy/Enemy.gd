extends Node2D

const DEFAULT_ENEMY_SIZE = 50

var health : int

func _ready():
	add_to_group("Enemies")

func set_health(health : int):
	self.health = health
	$KinematicBody2D/HealthBar.max_value = health
	$KinematicBody2D/HealthBar.value = health

func _process(delta):
	if health <= 0:
		die()

func take_damage(damage : int):
	health -= damage
	$KinematicBody2D/HealthBar.value = health

func die():
	visible = false
