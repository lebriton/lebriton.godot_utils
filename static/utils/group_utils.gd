class_name GroupUtils
extends Object


static func get_all_groups(node: Node) -> Array[StringName]:
	var d = {}
	for child in node.find_children("*", "", true, false):
		for group_name in child.get_groups():
			d[group_name] = true
	var groups: Array[StringName]
	groups.assign(d.keys())
	return groups
