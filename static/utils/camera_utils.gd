class_name CameraUtils
extends Object


static func project_on_plane(camera: Camera3D, position: Vector2, y_lock: float = 0.0) -> Vector3:
	var from = camera.project_ray_origin(position)
	var to = camera.project_ray_normal(position)

	var plane = Plane(Vector3.UP, y_lock)
	var intersection = plane.intersects_ray(from, to)

	if intersection:
		return Vector3(intersection.x, y_lock, intersection.z)

	return Vector3.INF
