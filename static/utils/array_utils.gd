class_name ArrayUtils
extends Node


static func enumerate_duplicates(strings: Array) -> Array[String]:
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


static func has_duplicates(array: Array) -> bool:
	var seen := {}
	for item in array:
		if seen.has(item):
			return true
		seen[item] = true
	return false
