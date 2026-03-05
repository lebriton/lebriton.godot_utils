class_name DictUtils
extends Object


static func for_each(dict: Dictionary, method: Callable) -> void:
	for key in dict.keys():
		var value = dict[key]
		method.call(key, value)


static func pop_key(dict: Dictionary, key: Variant, default: Variant = null) -> Variant:
	if not dict.has(key):
		return default
	var value = dict[key]
	dict.erase(key)
	return value
