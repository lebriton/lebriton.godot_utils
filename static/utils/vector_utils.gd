class_name VectorUtils
extends Object


static func vec2_to_3(vector: Vector2, y: float = 0.0) -> Vector3:
	return Vector3(vector.x, y, vector.y)


static func vec3_to_2(vector: Vector3) -> Vector2:
	return Vector2(vector.x, vector.z)
