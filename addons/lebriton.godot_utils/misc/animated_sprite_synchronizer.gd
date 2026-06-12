class_name AnimatedSpriteSynchronizer
extends Node

@export var primary_sprite: AnimatedSprite2D:
	set(value):
		if primary_sprite != value:
			primary_sprite = value
			primary_sprite.animation_changed.connect(_sync_animation)
			primary_sprite.frame_changed.connect(_sync_frame)
@export var synced_sprites: Array[AnimatedSprite2D]


func _ready():
	_sync_animation()
	_sync_frame()


func _sync_animation():
	for sprite in synced_sprites:
		sprite.animation = primary_sprite.animation


func _sync_frame():
	for sprite in synced_sprites:
		sprite.frame = primary_sprite.frame
