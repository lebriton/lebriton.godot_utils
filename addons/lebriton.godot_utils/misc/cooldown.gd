class_name Cooldown
extends Resource

@export_group("Required")

@export_group("Parameters")
@export_custom(PROPERTY_HINT_NONE, "suffix:ms") var duration: int = 200

var _last_time: float = -1.0


func is_ready() -> bool:
	if _last_time < 0:
		return true
	return Time.get_ticks_msec() - _last_time >= duration


func reset():
	_last_time = Time.get_ticks_msec()
