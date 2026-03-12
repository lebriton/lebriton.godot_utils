class_name CameraUtils
extends Object


static func project_on_plane(camera: Camera3D, plane: Plane, position: Vector2) -> Variant:
	var from = camera.project_ray_origin(position)
	var to = camera.project_ray_normal(position)
	return plane.intersects_ray(from, to)
