class_name CameraUtils
extends Object


static func get_gridmap_cell_position_from_screen_position(
	camera: Camera3D,
	grid_map: GridMap,
	screen_point: Vector2,
	direct_space_state: PhysicsDirectSpaceState3D,
	sentinel: Vector3i,
	offset_factor: float = 0.0,
) -> Vector3i:
	var from := camera.project_ray_origin(screen_point)
	var to := camera.project_ray_normal(screen_point) * camera.far

	var query_parameters := PhysicsRayQueryParameters3D.create(from, to)
	var result := direct_space_state.intersect_ray(query_parameters)

	if not result or result.collider != grid_map:
		return sentinel

	# If the mesh extends beyond its GridMap cell, the ray hit position may fall outside
	# the intended cell. Applying a small offset along the hit normal moves the point slightly
	# "inside" the mesh, ensuring local_to_map() returns the correct cell.
	var offset = grid_map.cell_size * offset_factor
	var local_pos = grid_map.to_local(result.position - result.normal * offset)

	# Adjust for cell_center flags to align the origin point for each axis
	if grid_map.cell_center_x:
		local_pos.x -= grid_map.cell_size.x / 2
	if grid_map.cell_center_y:
		local_pos.y -= grid_map.cell_size.y / 2
	if grid_map.cell_center_z:
		local_pos.z -= grid_map.cell_size.z / 2

	# Apply a minor positional offset to align with the grid cell's origin
	local_pos += Vector3(0.5, 0, 0.5)

	return grid_map.local_to_map(local_pos)


static func project_on_plane(camera: Camera3D, plane: Plane, screen_point: Vector2) -> Variant:
	var from = camera.project_ray_origin(screen_point)
	var to = camera.project_ray_normal(screen_point)
	return plane.intersects_ray(from, to)
