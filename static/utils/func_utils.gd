class_name FuncUtils
extends Object


static func bind_front(callable: Callable, ...args: Array):
	return func(...rest_args): return callable.callv(args + rest_args)
