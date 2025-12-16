class_name AttackComponent
extends Node

signal defenders_changed(defenders: Array[HealthComponent])

@export_group("Required")
@export var character: Character

@export_group("Parameters")
@export var auto_cleanup := true

var _defenders: Array[HealthComponent]


func attack(damage_callable: Callable, amount = -1):
	var attacked := 0

	for health_component in _defenders:
		if health_component.is_dead():
			continue

		var damage: int = damage_callable.call(health_component)
		health_component.apply_damage(damage)
		attacked += 1

		# Stop if we've reached the desired amount (unless amount == -1)
		if amount > 0 and attacked >= amount:
			break


func track(health_component: HealthComponent):
	if auto_cleanup:
		health_component.died.connect(untrack.bind(health_component))

	_defenders.append(health_component)
	defenders_changed.emit(_defenders)


func untrack(health_component: HealthComponent):
	_defenders.erase(health_component)
	defenders_changed.emit(_defenders)
