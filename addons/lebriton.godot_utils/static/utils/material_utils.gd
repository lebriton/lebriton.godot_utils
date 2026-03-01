class_name MaterialUtils
extends Node


static func create_shader_material(shader: Shader, params: Dictionary = {}) -> ShaderMaterial:
	var material := ShaderMaterial.new()
	material.shader = shader

	for key in params.keys():
		material.set_shader_parameter(key, params[key])

	return material
