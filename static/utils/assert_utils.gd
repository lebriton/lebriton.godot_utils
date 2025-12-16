class_name AssertUtils
extends Object


static func assert_has_signal(obj: Object, signal_name: String):
	assert(obj.has_signal(signal_name), "Object %s does not have signal '%s'" % [obj, signal_name])
