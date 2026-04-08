class_name PrototypeCloner
extends Node

@export_group("Required")
@export var prototype: Node
@export var container: Node

@export_group("Parameters")
@export var auto_detach_prototype := false

var _copies: Array[Node] = []


func _cleanup_copies():
	_copies = _copies.filter(func(c): return is_instance_valid(c))


func clear_copies():
	_cleanup_copies()

	for copy in _copies:
		copy.queue_free()
	_copies.clear()


func clone() -> Node:
	var copy = prototype.duplicate()
	container.add_child(copy)
	_copies.append(copy)
	return copy


func detach_prototype():
	NodeUtils.remove_from_parent.call_deferred(prototype)


func get_copies() -> Array[Node]:
	_cleanup_copies()

	return _copies


func _ready():
	if auto_detach_prototype:
		NodeUtils.when_ready(prototype, detach_prototype)


func set_clone_count(count: int) -> void:
	_cleanup_copies()

	# Remove extra copies if we have too many
	while _copies.size() > count:
		_copies.pop_back().queue_free()

	# Add missing copies if we have too few
	while _copies.size() < count:
		clone()
