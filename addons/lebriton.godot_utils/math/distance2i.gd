class_name Distance2i
extends RefCounted

var start_point: Vector2i
var end_point: Vector2i


func _init(
	p_start_point: Vector2i,
	p_end_point: Vector2i,
):
	start_point = p_start_point
	end_point = p_end_point


func x(absolute: bool = false) -> int:
	var delta_x = end_point.x - start_point.x
	return delta_x if not absolute else abs(delta_x)


func y(absolute: bool = false) -> int:
	var delta_y = end_point.y - start_point.y
	return delta_y if not absolute else abs(delta_y)


func manhattan_distance() -> int:
	return x(true) + y(true)
