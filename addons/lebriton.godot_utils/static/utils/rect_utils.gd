class_name RectUtils
extends Object


static func random_2i_choice(
	rect: Rect2i,
	count: int = 1,
	rng: RandomNumberGenerator = null,
) -> Array:
	var f_randi_range = rng.randi_range if rng else randi_range

	var points = []
	count = min(count, rect.get_area())

	while points.size() < count:
		var random_x = rect.position.x + f_randi_range.call(0, rect.size.x - 1)
		var random_y = rect.position.y + f_randi_range.call(0, rect.size.y - 1)
		var point = Vector2i(random_x, random_y)

		if point not in points:
			points.append(point)

	return points
