class_name ProcessUtils
extends Object


static func get_frame(obj: Object) -> int:
	return obj.get_meta("frame") if obj.has_meta("frame") else -1


static func is_frame_synced(obj: Object, frame: int) -> bool:
	return frame >= get_frame(obj)


static func is_frame_synced_with(obj: Object, other: Object) -> bool:
	return is_frame_synced(obj, get_frame(other))


static func set_current_frame(obj: Object) -> void:
	set_process_frames(obj, Engine.get_process_frames())


static func set_process_frames(obj: Object, process_frames: int):
	obj.set_meta("frame", process_frames)
