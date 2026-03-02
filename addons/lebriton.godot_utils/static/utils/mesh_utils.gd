class_name MeshUtils
extends Object


static func transform_mesh_arrays(mesh_arrays: Array, transform: Transform3D) -> Array:
	mesh_arrays[ArrayMesh.ARRAY_VERTEX] = PackedArrayUtils.map(
		mesh_arrays[ArrayMesh.ARRAY_VERTEX], func(vertex): return vertex * transform
	)
	return mesh_arrays
