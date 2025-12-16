class_name HealthComponent
extends Node

signal damage_taken(result: ValueChangeResult)
signal died
signal full_health_restored
signal healed(result: ValueChangeResult)
signal health_changed  # TODO: stop signal spam

@export var maximum_health: int = 999_999_999:
	set(value):
		maximum_health = value
		if health > value:
			health = value
		health_changed.emit()

var health: int = maximum_health:
	set(value):
		health = value
		health_changed.emit()


func apply_damage(amount: int) -> ValueChangeResult:
	var result = ValueChangeResult.new(amount)
	if health < amount:
		result.overflow = amount - health
		result.applied = health
		health = 0
	else:
		health -= amount
		result.applied = amount
		result.overflow = 0
	damage_taken.emit(result)
	if is_dead():
		died.emit()
	return result


func apply_healing(amount: int) -> ValueChangeResult:
	var result = ValueChangeResult.new(amount)
	var new_health = health + amount
	if new_health > maximum_health:
		result.overflow = new_health - maximum_health
		result.applied = maximum_health - health
		health = maximum_health
	else:
		health = new_health
		result.applied = amount
		result.overflow = 0
	healed.emit(result)
	if is_full_health():
		full_health_restored.emit()
	return result


func get_percentage() -> float:
	return float(health) / maximum_health


func is_alive() -> bool:
	return not is_dead()


func is_dead() -> bool:
	return health == 0


func is_full_health() -> bool:
	return health == maximum_health
