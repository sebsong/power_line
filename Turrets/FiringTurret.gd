extends "res://Power/PowerSink.gd"

const DEFAULT_TURRET_SIZE = 75

# number of shots per second
var fire_rate : float
var turret_range : float
var damage: float

var fire_cooldown : float = 0
var fire_cooldown_reset : float

func _ready():
	pass

func set_damage(damage : float):
	self.damage = damage

func set_turret_range(turret_range : float):
	self.turret_range = turret_range

func set_fire_rate(fire_rate : float):
	self.fire_rate = fire_rate
	self.fire_cooldown_reset = 1 / fire_rate

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if has_power and fire_cooldown <= 0:
		fire()
		fire_cooldown = fire_cooldown_reset
	fire_cooldown -= delta

# return an array of enemies in range
func get_enemies_in_range() -> Array:
	var enemies_in_range = []

	var enemies = get_tree().get_nodes_in_group("Enemies")
	for enemy in enemies:
		if get_distance_from_turret(enemy) <= turret_range:
			enemies_in_range.append(enemy)
	
	return enemies_in_range

func get_closest_enemy_in_range() -> Node2D:
	var enemies_in_range = get_enemies_in_range()

	if enemies_in_range.empty():
		return null

	var closest_enemy
	var closest_enemy_distance
	for enemy in enemies_in_range:
		if closest_enemy == null:
			closest_enemy = enemy
		else:
			var enemy_distance = get_distance_from_turret(enemy)
			if enemy_distance < closest_enemy_distance:
				closest_enemy = enemy
				closest_enemy_distance = enemy_distance
	return closest_enemy

func get_distance_from_turret(node) -> float:
	return (node.position - position).length()

# Turrets should override this with specific firing behavior
func fire() -> void:
	pass
