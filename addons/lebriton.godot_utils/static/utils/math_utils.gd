class_name MathUtils
extends Object


static func list_to_deltas(numbers: Array) -> Array:
	var deltas := []

	for i in range(1, numbers.size()):
		deltas.append(numbers[i] - numbers[i - 1])

	return deltas
