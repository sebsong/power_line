extends "res://Turrets/FiringTurret.gd"

const DEFAULT_FIRE_RATE : float = 1.0
const DEFAULT_TURRET_RANGE : float = 250.0
const DEFAULT_DAMAGE : float = 10.0

var burst_radius : float

func _ready():
	set_fire_rate(DEFAULT_FIRE_RATE)
	set_turret_range(DEFAULT_TURRET_RANGE)
	set_damage(DEFAULT_DAMAGE)

	Global.resize_kinematic_body($KinematicBody2D, DEFAULT_TURRET_SIZE, DEFAULT_TURRET_SIZE)
	Global.resize_sprite($Burst, turret_range * 2, turret_range * 2)

func _process(_delta):
	set_damage(DEFAULT_DAMAGE * connections.size())

func fire():
	$Burst.frame = 0
	$Burst.play()

	for enemy in get_enemies_in_range():
		enemy.take_damage(damage)
