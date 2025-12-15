class_name StringUtils
extends Node

const SEPARATOR := ":"


static func to_prefixed(prefix: String, string: String, separator: String = SEPARATOR) -> String:
	assert(separator not in prefix, "Prefix must not contain separator '%s'" % separator)
	assert(separator not in string, "String must not contain separator '%s'" % separator)
	return "%s%s%s" % [prefix, separator, string]


static func from_prefixed(value: String, separator: String = SEPARATOR) -> PackedStringArray:
	if value.count(separator) != 1:
		return []
	return value.split(separator, false, 2)


static func has_prefix(prefix: String, value: String, separator: String = SEPARATOR) -> bool:
	var expected_prefix := "%s%s" % [prefix, separator]
	return value.begins_with(expected_prefix) and value.count(separator) == 1
