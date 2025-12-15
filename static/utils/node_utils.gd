class_name NodeUtils
extends Object


static func add_child_after(parent: Node, node: Node, sibling: Node) -> Node:
	parent.add_child(node)
	var index := sibling.get_index() + 1

	# Clamp so it works even if sibling was last child
	index = clamp(index, 0, parent.get_child_count() - 1)

	parent.move_child(node, index)
	return node


static func add_child_before(parent: Node, node: Node, sibling: Node) -> Node:
	parent.add_child(node)
	var index := sibling.get_index()
	parent.move_child(node, index)
	return node


static func add_to_parent(parent: Node, node: Node) -> Node:
	parent.add_child(node)
	return node


static func get_or_add_child(parent: Node, name: StringName, callable: Callable) -> Node:
	for child in parent.get_children():
		if child.name == name:
			return child

	var new_child: Node = callable.call()
	new_child.name = name
	parent.add_child(new_child)
	return new_child


static func instantiate(parent: Node, packed_scene: PackedScene) -> Variant:
	var scene = packed_scene.instantiate()
	parent.add_child(scene)
	return scene


static func remove_from_parent(node: Node) -> Node:
	node.get_parent().remove_child(node)
	return node


static func wait_for_node_ready(node: Node):
	# https://github.com/godotengine/godot-proposals/issues/325#issuecomment-1643230075
	if not node.is_node_ready():
		await node.ready


static func when_ready(node: Node, callable: Callable) -> void:
	if node.is_node_ready():
		callable.call()
	else:
		node.ready.connect(callable, ConnectFlags.CONNECT_ONE_SHOT)
