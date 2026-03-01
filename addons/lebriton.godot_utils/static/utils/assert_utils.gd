class_name AssertUtils
extends Object


static func assert_has_method(obj: Object, method_name: String) -> void:
	assert(obj.has_method(method_name), _error_message(obj, "method", method_name))


static func assert_has_property(obj: Object, property_name: String) -> void:
	assert(obj.has_property(property_name), _error_message(obj, "property", property_name))


static func assert_has_signal(obj: Object, signal_name: String) -> void:
	assert(obj.has_signal(signal_name), _error_message(obj, "signal", signal_name))


static func _error_message(obj: Object, type: String, name: String) -> String:
	return "Object %s does not have %s '%s'" % [obj, type, name]
