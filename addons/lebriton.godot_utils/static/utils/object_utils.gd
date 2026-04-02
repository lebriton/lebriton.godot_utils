class_name ObjectUtils
extends Object


static func swap_value_and_update_signals(
	object: Object,
	property: StringName,
	new_value: Node,
	signal_handlers: Dictionary,
	bind_node: bool = false,
):
	var previous_value = object.get(property)
	if previous_value:
		SignalUtils.disconnect_signals(previous_value, signal_handlers)

	object.set(property, new_value)

	if new_value:
		SignalUtils.connect_signals(new_value, signal_handlers, bind_node)
