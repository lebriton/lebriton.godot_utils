class_name Vector2Utils
extends Object


static func smooth_to(
	current: Vector2, target: Vector2, smoothing: bool = true, weight: float = 0.5
) -> Vector2:
	# Handle first-frame initialization
	if current == Vector2.INF:
		return target

	# Perform interpolation
	if smoothing:
		return lerp(current, target, weight)

	return target
