# See https://shaggydev.com/2025/06/12/godot-awaiting-signals/

class_name SignalGroup
extends RefCounted

signal complete

var _signals: Array[Signal] = []


func add(sig: Signal):
	_signals.append(sig)


func add_array(array: Array):
	_signals.append_array(array)


func all() -> Array[Signal]:
	return await _run(_signals.size())


func any() -> Array[Signal]:
	return await _run(1)


func _init(signals: Array = []):
	_signals.assign(signals)


func _on_signal_completed(sig: Signal, completion_order: Array[Signal], quota: int):
	if completion_order.size() < quota:
		completion_order.append(sig)
	if completion_order.size() == quota:
		complete.emit()


func _run(quota: int) -> Array[Signal]:
	assert(_signals.size() > 0)

	var completion_order: Array[Signal] = []

	for sig in _signals:
		sig.connect(_on_signal_completed.bind(sig, completion_order, quota), CONNECT_ONE_SHOT)
	await complete

	for sig in _signals:
		if sig.is_connected(_on_signal_completed):
			sig.disconnect(_on_signal_completed)
	return completion_order
