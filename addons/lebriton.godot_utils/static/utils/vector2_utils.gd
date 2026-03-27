class_name Vector2Utils
extends Object


static func vector_to_grid_dir(direction: Vector2) -> Vector2:
	if direction == Vector2.ZERO:
		return Vector2.ZERO

	var angle = atan2(direction.y, direction.x)
	var step = PI / 4.0  # 45°

	var snapped = round(angle / step) * step
	return Vector2(cos(snapped), sin(snapped)).round()


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
