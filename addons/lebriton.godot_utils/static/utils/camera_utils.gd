class_name CameraUtils
extends Object


static func get_gridmap_cell_position_from_screen_position(
	camera: Camera3D,
	grid_map: GridMap,
	screen_point: Vector2,
	direct_space_state: PhysicsDirectSpaceState3D,
	sentinel: Vector3i,
	offset_factor: float = 0.25,
) -> Vector3i:
	var from := camera.project_ray_origin(screen_point)
	var to := camera.project_ray_normal(screen_point) * camera.far

	var query_parameters := PhysicsRayQueryParameters3D.create(from, to)
	var result := direct_space_state.intersect_ray(query_parameters)

	if not result or result.collider != grid_map:
		return sentinel

	# When a mesh extends outside its GridMap cell, the ray hit position may lie
	# just outside the intended cell. Subtracting a small offset along the hit normal
	# pushes the point slightly "inside" the mesh, so local_to_map() maps it to the
	# correct cell. The factor is arbitrary and may need tweaking depending on how far
	# the mesh sticks out of its cell.
	var offset = grid_map.cell_size.length() * offset_factor
	var local_pos = grid_map.to_local(result.position - result.normal * offset)
	var cell_position := grid_map.local_to_map(local_pos)

	return cell_position


static func project_on_plane(camera: Camera3D, plane: Plane, screen_point: Vector2) -> Variant:
	var from = camera.project_ray_origin(screen_point)
	var to = camera.project_ray_normal(screen_point)
	return plane.intersects_ray(from, to)
