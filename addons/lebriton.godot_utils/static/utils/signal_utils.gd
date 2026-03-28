class_name SignalUtils
extends Object


static func connect_signals(node: Node, signal_handlers: Dictionary, bind_node: bool = false):
	DictUtils.for_each(
		signal_handlers,
		func(signal_name, signal_handler):
			if bind_node:
				signal_handler = signal_handler.bind(node)
			node.connect(signal_name, signal_handler)
	)


static func disconnect_signals(node: Node, signal_handlers: Dictionary):
	DictUtils.for_each(
		signal_handlers,
		func(signal_name, signal_handler): node.disconnect(signal_name, signal_handler)
	)
