class_name GeometryUtils
extends Node


static func compute_aligned_offset(anchors_preset: Types.AnchorsPreset, size: Vector2) -> Vector2:
	var offset := Vector2.ZERO

	match anchors_preset:
		Types.AnchorsPreset.TOP_LEFT:
			offset = Vector2(0, 0)
		Types.AnchorsPreset.TOP_CENTER:
			offset = Vector2(size.x / 2.0, 0)
		Types.AnchorsPreset.TOP_RIGHT:
			offset = Vector2(size.x, 0)
		Types.AnchorsPreset.CENTER_LEFT:
			offset = Vector2(0, size.y / 2.0)
		Types.AnchorsPreset.CENTER:
			offset = Vector2(size.x / 2.0, size.y / 2.0)
		Types.AnchorsPreset.CENTER_RIGHT:
			offset = Vector2(size.x, size.y / 2.0)
		Types.AnchorsPreset.BOTTOM_LEFT:
			offset = Vector2(0, size.y)
		Types.AnchorsPreset.BOTTOM_CENTER:
			offset = Vector2(size.x / 2.0, size.y)
		Types.AnchorsPreset.BOTTOM_RIGHT:
			offset = Vector2(size.x, size.y)

	return offset


static func compute_list_offset(
	anchors_preset: Types.AnchorsPreset,
	direction: Vector2,
	index: int,
	total: int,
	item_size: Vector2,
	gap: float = 0.0
) -> Vector2:
	# Safety: avoid zero-length direction
	if direction.length() == 0.0:
		direction = Vector2.RIGHT
	direction = direction.normalized()

	# Projected advance (how much top-left shifts along direction per item)
	var dir_abs = Vector2(abs(direction.x), abs(direction.y))
	var proj_len = item_size.x * dir_abs.x + item_size.y * dir_abs.y

	# Step vector between successive item top-left positions
	var step = direction * (proj_len + gap)

	# Top-left position of the current item before alignment
	var current_item_pos = step * index

	# First and last item top-left positions (before alignment)
	var first_item_pos = Vector2(0, 0)
	var last_item_pos = step * max(0, total - 1)

	# Axis-aligned bounding box that contains all item rectangles:
	# compute component-wise min/max including item size
	var bounds_min = Vector2(
		min(first_item_pos.x, last_item_pos.x), min(first_item_pos.y, last_item_pos.y)
	)
	var bounds_max = Vector2(
		max(first_item_pos.x, last_item_pos.x) + item_size.x,
		max(first_item_pos.y, last_item_pos.y) + item_size.y
	)

	var total_size = bounds_max - bounds_min  # axis-aligned width/height of entire list

	# Translate item positions so bounding box origin is (0,0)
	var item_pos_local = current_item_pos - bounds_min

	# Alignment offset for the full bounding box (expects axis-aligned size)
	var align_offset = compute_aligned_offset(anchors_preset, total_size)

	# Final top-left for this item (apply alignment)
	return -align_offset + item_pos_local
