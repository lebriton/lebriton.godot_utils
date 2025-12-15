class_name OnReady
extends Node

enum Behavior { HIDE_NODE, MAKE_TRANSPARENT }

@export_group("Required")
@export var node: Node

@export_group("Parameters")
@export var behavior := Behavior.HIDE_NODE


func _ready():
	match behavior:
		Behavior.HIDE_NODE:
			node.hide()
		Behavior.MAKE_TRANSPARENT:
			if node is CanvasItem:
				node.modulate.a = 0.0
	queue_free()
