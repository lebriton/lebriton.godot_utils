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
