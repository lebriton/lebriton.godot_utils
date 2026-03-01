class_name AttackComponent
extends Node

signal defenders_changed(defenders: Array[HealthComponent])

@export_group("Required")

@export_group("Parameters")

var _defenders: Array[HealthComponent]


func attack(whitelist_callable: Callable, damage_callable: Callable):
	var targets: Array = whitelist_callable.call(_defenders)

	for health_component in targets:
		var damage: int = damage_callable.call(health_component)
		health_component.apply_damage(damage)


func track(health_component: HealthComponent):
	_defenders.append(health_component)
	defenders_changed.emit(_defenders)


func untrack(health_component: HealthComponent):
	_defenders.erase(health_component)
	defenders_changed.emit(_defenders)
