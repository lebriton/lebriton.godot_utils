class_name SignalUtils
extends Object


static func connect_signals(obj: Object, signal_handlers: Dictionary, bind_obj: bool = false):
	DictUtils.for_each(
		signal_handlers,
		func(signal_name, signal_handler):
			if bind_obj:
				signal_handler = signal_handler.bind(obj)
			obj.connect(signal_name, signal_handler)
	)


static func connect_with_id(id: Variant, obj: Object, signal_name: StringName, callable: Callable):
	var signal_handlers = MetaUtils.get_or_create_meta(obj, "signal_handlers", func(): return {})
	signal_handlers[id] = callable
	obj.connect(signal_name, callable)


static func disconnect_by_id(id: Variant, obj: Object, signal_name: StringName):
	var signal_handlers = MetaUtils.get_or_create_meta(obj, "signal_handlers", func(): return {})
	if signal_handlers.has(id):
		var callable = signal_handlers[id]
		if obj.is_connected(signal_name, callable):
			obj.disconnect(signal_name, callable)
		signal_handlers.erase(id)


static func disconnect_signals(node: Node, signal_handlers: Dictionary):
	DictUtils.for_each(
		signal_handlers,
		func(signal_name, signal_handler): node.disconnect(signal_name, signal_handler)
	)
