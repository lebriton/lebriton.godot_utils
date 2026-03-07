class_name SpriteUtils
extends Object


static func get_animated_sprite_current_texture(s) -> Texture2D:
	if not s.sprite_frames:
		return null

	return s.sprite_frames.get_frame_texture(s.animation, s.frame)
