# https://github.com/godotengine/godot-proposals/discussions/11471#discussioncomment-11762037

@tool
class_name ScaledContainer
extends Container

@export var content_scale := 1.0:
	set(v):
		content_scale = v
		queue_sort()


func _get_minimum_size() -> Vector2:
	var min_size := Vector2.ZERO

	for child: Control in get_children():
		if not child.visible:
			continue

		min_size.x = max(min_size.x, child.get_combined_minimum_size().x)
		min_size.y = max(min_size.y, child.get_combined_minimum_size().y)

	return min_size


func _notification(what: int):
	match what:
		NOTIFICATION_SORT_CHILDREN:
			for child: Control in get_children():
				child.set_anchors_and_offsets_preset(
					Control.PRESET_FULL_RECT, Control.PRESET_MODE_MINSIZE
				)
				child.size /= content_scale
				child.scale = Vector2(content_scale, content_scale)
