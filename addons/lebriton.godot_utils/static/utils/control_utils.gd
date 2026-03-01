class_name ControlUtils
extends Object


static func connect_neighbors(nodes: Array, direction: Types.Direction, loop: bool):
	var size = nodes.size()
	if size < 2:
		return

	# Determine which properties to use for this direction
	var prev_prop := ""
	var next_prop := ""
	match direction:
		Types.Direction.VERTICAL:
			prev_prop = "focus_neighbor_top"
			next_prop = "focus_neighbor_bottom"
		Types.Direction.HORIZONTAL:
			prev_prop = "focus_neighbor_left"
			next_prop = "focus_neighbor_right"

	for i in range(size):
		var node = nodes[i]

		# Previous neighbor
		if i > 0:
			node.set(prev_prop, nodes[i - 1].get_path())
		elif loop:
			node.set(prev_prop, nodes[size - 1].get_path())

		# Next neighbor
		if i < size - 1:
			node.set(next_prop, nodes[i + 1].get_path())
		elif loop:
			node.set(next_prop, nodes[0].get_path())


static func disconnect_neighbors(nodes: Array):
	for node in nodes:
		node.focus_neighbor_top = NodePath("")
		node.focus_neighbor_bottom = NodePath("")
		node.focus_neighbor_left = NodePath("")
		node.focus_neighbor_right = NodePath("")


static func get_global_scale(node: Control) -> Vector2:
	return node.get_global_transform_with_canvas().get_scale()


static func get_normalized_screen_position(node: Control) -> Vector2:
	var gs := ControlUtils.get_global_scale(node)
	var screen_position := (
		node.get_screen_position()
		+ GeometryUtils.compute_aligned_offset(Types.AnchorsPreset.CENTER, node.size) * gs
	)

	var viewport_size := node.get_viewport_rect().size

	return screen_position / viewport_size * 2 - Vector2(1, 1)
