# https://github.com/godotengine/godot-proposals/discussions/11471#discussioncomment-11762037

@tool
class_name ScaledContainer
extends Container

enum ScaleMode { FIT, CENTER }

@export var scale_mode := ScaleMode.FIT
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

	if scale_mode == ScaleMode.FIT:
		min_size *= content_scale

	return min_size


func _notification(what: int):
	match what:
		NOTIFICATION_SORT_CHILDREN:
			for child: Control in get_children():
				var preset: LayoutPreset

				match scale_mode:
					ScaleMode.FIT:
						preset = Control.PRESET_FULL_RECT
					ScaleMode.CENTER:
						preset = Control.PRESET_CENTER
						child.pivot_offset = child.size / 2.0

				child.set_anchors_and_offsets_preset(preset, Control.PRESET_MODE_MINSIZE)
				child.size /= content_scale
				child.scale = Vector2(content_scale, content_scale)
