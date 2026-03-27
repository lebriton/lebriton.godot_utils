class_name InputUtils
extends Object

static var _repeat_state := {}


static func get_repeating_vector(
	id: StringName,
	negative_x: StringName,
	positive_x: StringName,
	negative_y: StringName,
	positive_y: StringName,
	delta: float,
	initial_delay: float,
	repeat_interval: float,
	deadzone: float = -1.0,
) -> Vector2:
	var dir = Input.get_vector(negative_x, positive_x, negative_y, positive_y, deadzone)

	if not _repeat_state.has(id):
		_repeat_state[id] = {
			"last_dir": Vector2.ZERO,
			"timer": 0.0,
			"repeating": false,
		}

	var state = _repeat_state[id]

	if dir == Vector2.ZERO:
		# No input
		state["last_dir"] = Vector2.ZERO
		state["timer"] = 0.0
		state["repeating"] = false
	else:
		if dir != state["last_dir"] and state["last_dir"] == Vector2.ZERO:
			# New direction pressed
			state["last_dir"] = dir
			state["timer"] = 0.0
			state["repeating"] = false
			return dir

		state["timer"] += delta
		if not state["repeating"] and state["timer"] >= initial_delay:
			state["repeating"] = true
			state["timer"] = 0.0
			return dir

		if state["repeating"] and state["timer"] >= repeat_interval:
			state["timer"] = 0.0
			return dir

	return Vector2.ZERO
