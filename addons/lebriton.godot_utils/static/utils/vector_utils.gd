class_name VectorUtils
extends Object


func is_cardinal(vector: Vector2i) -> bool:
	return abs(vector.x) + abs(vector.y) == 1


static func vec2_to_2i(vector: Vector2) -> Vector2i:
	return Vector2i(vector)


static func vec2_to_2i_with_remaining(vector: Vector2) -> Array:
	var new_vector := Vector2i(vector)
	var remaining := vector - Vector2(new_vector)
	return [new_vector, remaining]


static func vec2_to_3(vector: Vector2, y: float = 0.0) -> Vector3:
	return Vector3(vector.x, y, vector.y)


static func vec2i_to_2(vector: Vector2i) -> Vector2:
	return Vector2(vector)


static func vec2i_to_3(vector: Vector2i, y: int = 0) -> Vector3:
	return Vector3(vector.x, y, vector.y)


static func vec2i_to_3i(vector: Vector2i, y: int = 0) -> Vector3:
	return Vector3i(vector.x, y, vector.y)


static func vec3_to_2(vector: Vector3) -> Vector2:
	return Vector2(vector.x, vector.z)


static func vec3i_to_2(vector: Vector3i) -> Vector2:
	return Vector2(vector.x, vector.z)
