class_name Distance3i
extends RefCounted

var start_point: Vector3i
var end_point: Vector3i


func _init(
	p_start_point: Vector3i,
	p_end_point: Vector3i,
):
	start_point = p_start_point
	end_point = p_end_point


func x(absolute: bool = false) -> int:
	var delta_x = end_point.x - start_point.x
	return delta_x if not absolute else abs(delta_x)


func y(absolute: bool = false) -> int:
	var delta_y = end_point.y - start_point.y
	return delta_y if not absolute else abs(delta_y)


func z(absolute: bool = false) -> int:
	var delta_z = end_point.z - start_point.z
	return delta_z if not absolute else abs(delta_z)


func manhattan_distance() -> int:
	return x(true) + y(true) + z(true)
