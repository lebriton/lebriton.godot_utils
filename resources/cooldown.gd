extends Resource
class_name Cooldown

@export_group("Required")

@export_group("Parameters")
@export var duration: float = 1.0

var _last_time: float = -1.0


func ready() -> bool:
	if _last_time < 0:
		return true
	return Time.get_ticks_msec() - _last_time >= duration * 1000


func reset():
	_last_time = Time.get_ticks_msec()
