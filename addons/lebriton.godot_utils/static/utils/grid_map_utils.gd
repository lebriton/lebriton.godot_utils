class_name GridMapUtils
extends Object


static func fill_rect(
	grid_map: GridMap,
	rect: Rect2i,
	y: int,
	cell_item: int,
	predicate: Callable = func(_foo): return true,
):
	var start = rect.position
	var end = rect.position + rect.size

	for x in range(start.x, end.x):
		for z in range(start.y, end.y):
			_set_cell_item(
				grid_map,
				Vector3i(x, y, z),
				cell_item,
				predicate,
			)


static func reset_rect(
	grid_map: GridMap,
	rect: Rect2i,
	y: int,
	predicate: Callable = func(_foo): return true,
):
	fill_rect(
		grid_map,
		rect,
		y,
		GridMap.INVALID_CELL_ITEM,
		predicate,
	)


static func _set_cell_item(
	grid_map: GridMap,
	cell_position: Vector3i,
	cell_item: int,
	predicate: Callable,
) -> bool:
	if not predicate.call(cell_position):
		return false
	grid_map.set_cell_item(cell_position, cell_item)
	return true
