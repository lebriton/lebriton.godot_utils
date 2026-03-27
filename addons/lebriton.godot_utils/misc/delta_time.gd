class_name DeltaTime
extends Resource

@export_group("Required")

@export_group("Parameters")

var _last_time: float = -1.0


func get_elapsed(update: bool = true) -> float:
	var current_time := Time.get_ticks_msec()

	if _last_time < 0:
		_last_time = current_time
		return 0.0

	var delta := (current_time - _last_time) / 1000.0

	if update:
		_last_time = current_time

	return delta
