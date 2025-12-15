class_name MetaUtils
extends Node


static func set_dict(obj: Object, dict: Dictionary):
	for meta_name in dict:
		var meta_value = dict[meta_name]
		obj.set_meta(meta_name, meta_value)
