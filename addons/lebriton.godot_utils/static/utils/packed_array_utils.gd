class_name PackedArrayUtils
extends Object

# NOTE:
# I am aware that PackedArrays are intended to be used for performance optimization,
# and these utility functions go against this principle by manipulating PackedArrays
# in ways that may reduce their efficiency. However, sometimes the Godot API returns
# PackedArrays, and they are not always easy to work with directly.


func erase(packed_array, value: Variant):
	var index = packed_array.find(value)
	if index != -1:
		packed_array.remove_at(index)


func filter(packed_array, method: Callable) -> Array:
	var result_array = []

	for i in range(packed_array.size()):
		if method.call(packed_array[i]):
			result_array.append(packed_array[i])

	return result_array


func map(packed_array, method: Callable):
	var result_array = packed_array.duplicate()

	for i in range(result_array.size()):
		result_array[i] = method.call(result_array[i])

	return result_array
