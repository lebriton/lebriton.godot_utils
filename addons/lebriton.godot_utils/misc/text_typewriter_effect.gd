class_name TextTypewriterEffect
extends Node

signal animation_finished
signal character_typed(character: String)

const DEFAULT_CPS := 40.0
const DEFAULT_PUNCTUATION_DELAY := 0.5
const PUNCTUATION_CHARS := [".", "!", "?", ",", ";", ":"]

@export_group("Required")
@export var label: RichTextLabel

@export_group("Parameters")
## Characters per second for typewriter text effect
@export_range(0.001, 1000.0, 0.001, "suffix:s") var cps := DEFAULT_CPS
## Delay after punctuation characters (seconds)
@export_range(0.001, 10.0, 0.001, "suffix:s") var punctuation_delay := DEFAULT_PUNCTUATION_DELAY
@export var autostart := false


func animate():
	for i in range(label.get_total_character_count()):
		var character = label.get_parsed_text()[i]

		label.visible_characters = i + 1
		character_typed.emit(character)

		var delay = punctuation_delay if character in PUNCTUATION_CHARS else 1.0 / cps
		await get_tree().create_timer(delay).timeout
	animation_finished.emit()


func _ready():
	if autostart:
		animate()
