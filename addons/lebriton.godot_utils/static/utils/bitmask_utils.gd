class_name BitmaskUtils
extends Object


static func add_layer(mask: int, layer: int) -> int:
	return mask | layer


static func has_layer(mask: int, layer: int) -> bool:
	return (mask & layer) != 0


static func toggle_layer(mask: int, layer: int) -> int:
	return mask ^ layer


static func remove_layer(mask: int, layer: int) -> int:
	return mask & ~layer


static func set_layer(mask: int, layer: int, enabled: bool) -> int:
	if enabled:
		return add_layer(mask, layer)
	return remove_layer(mask, layer)
