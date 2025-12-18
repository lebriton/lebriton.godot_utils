class_name TweenUtils
extends Object


static func get_or_create_tween(node: Node, meta_name: StringName = "tween") -> Tween:
	if node.has_meta(meta_name):
		var tween := node.get_meta(meta_name)
		if tween and tween.is_valid():
			return tween

	var tween := node.create_tween()
	node.set_meta(meta_name, tween)
	return tween


static func is_tween_running(tween: Tween) -> bool:
	return tween and tween.is_running()


static func kill_tween_if_running(tween: Tween) -> void:
	if tween and tween.is_running():
		tween.kill()
