class_name MathUtils
extends Object


static func list_to_deltas(numbers: Array) -> Array:
	var deltas := []

	for i in range(1, numbers.size()):
		deltas.append(numbers[i] - numbers[i - 1])

	return deltas


static func looped_clamp(value: int, min_value: int, max_value: int) -> int:
	var range := max_value - min_value + 1

	if range <= 0:
		return min_value

	return min_value + ((value - min_value) % range + range) % range


static func remap_float(
	value: float, from_min: float, from_max: float, to_min: float, to_max: float
) -> float:
	if is_equal_approx(from_min, from_max):
		return to_min

	return to_min + (value - from_min) * (to_max - to_min) / (from_max - from_min)


static func remap_int(value: int, from_min: int, from_max: int, to_min: int, to_max: int) -> int:
	if from_min == from_max:
		return to_min

	return clampi(
		(
			to_min
			+ (
				((value - from_min) * (to_max - to_min) + (from_max - from_min) / 2)
				/ (from_max - from_min)
			)
		),
		mini(to_min, to_max),
		maxi(to_min, to_max)
	)
