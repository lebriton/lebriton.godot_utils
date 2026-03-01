class_name ValueChangeResult
extends RefCounted

var amount: int
var applied: int
var overflow: int


func _init(p_amount: int, p_applied: int = 0, p_overflow: int = 0):
	amount = p_amount
	applied = p_applied
	overflow = p_overflow
