class_name TweenUtils
extends Object


static func is_tween_running(tween: Tween) -> bool:
	return tween and tween.is_running()


static func kill_tween_if_running(tween: Tween) -> void:
	if tween and tween.is_running():
		tween.kill()
