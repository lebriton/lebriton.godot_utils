class_name ArrayUtils
extends Object


func back(array: Array):
	# This function is a safe wrapper that helps avoid runtime errors
	# by preventing access to an empty array.
	return null if array.is_empty() else array.back()


# This utility mimics Python's enumerate().
# It is less efficient than a classic indexed loop because it allocates a new array,
# but it significantly improves readability and maintainability of iteration code.
static func enumerate(array: Array):
	var result = []
	var size = array.size()

	for i in range(size):
		result.append({"index": i, "value": array[i], "is_first": i == 0, "is_last": i == size - 1})

	return result


static func _find_item_in_direction(
	items: Array,
	current_item: Variant,
	step: int,
	loop: bool = false,
	predicate: Callable = func(_item): return true
) -> Variant:
	if items.is_empty():
		return null

	var current_index = items.find(current_item)

	var start_index = current_index

	while true:
		var next_index = current_index + step
		if loop:
			# Wrap around using modulo
			next_index = next_index % items.size()
		else:
			# Stop if we go out of bounds
			if next_index < 0 or next_index >= items.size():
				break
		var next_item = items[next_index]

		if predicate.call(next_item):
			return next_item

		current_index = next_index

		# If we looped back to the starting item, stop
		if current_index == start_index:
			break

	return current_item  # No item met the predicate condition


static func find_next_item(
	items: Array,
	current_item: Variant,
	loop: bool = false,
	predicate: Callable = func(_item): return true
) -> Variant:
	return _find_item_in_direction(items, current_item, 1, loop, predicate)


static func find_previous_item(
	items: Array,
	current_item: Variant,
	loop: bool = false,
	predicate: Callable = func(_item): return true
) -> Variant:
	return _find_item_in_direction(items, current_item, -1, loop, predicate)


static func for_each(array: Array, method: Callable) -> void:
	for index in range(array.size()):
		method.call(array[index], index)


func front(array: Array):
	# This function is a safe wrapper that helps avoid runtime errors
	# by preventing access to an empty array.
	return null if array.is_empty() else array.front()


static func has_duplicates(array: Array) -> bool:
	var seen := {}
	for item in array:
		if seen.has(item):
			return true
		seen[item] = true
	return false


static func remove_freed_items(array: Array) -> Array:
	return array.filter(func(item): return is_instance_valid(item))


static func suffix_duplicates_with_index(strings: Array) -> Array[String]:
	var counts := {}
	var total_counts := {}
	var result: Array[String] = []

	# First, count total occurrences of each string
	for s in strings:
		total_counts[s] = total_counts.get(s, 0) + 1

	# Then, enumerate duplicates
	for s in strings:
		counts[s] = counts.get(s, 0) + 1
		if total_counts[s] > 1:
			result.append("%s %d" % [s, counts[s]])
		else:
			result.append(s)

	return result
