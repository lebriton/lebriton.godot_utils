class_name MetaUtils
extends Object


static func get_or_create_meta(obj: Object, name: StringName, default_factory: Callable) -> Variant:
	if obj.has_meta(name):
		return obj.get_meta(name)
	var value = default_factory.call()
	obj.set_meta(name, value)
	return value


static func set_dict(obj: Object, dict: Dictionary):
	for meta_name in dict:
		var meta_value = dict[meta_name]
		obj.set_meta(meta_name, meta_value)
