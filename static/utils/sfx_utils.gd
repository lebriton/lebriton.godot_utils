class_name SFXUtils
extends Object


static func _assert_is_audio_player(player: Node) -> void:
	assert(
		(
			player is AudioStreamPlayer
			or player is AudioStreamPlayer2D
			or player is AudioStreamPlayer3D
		),
		"player must be an AudioStreamPlayer, AudioStreamPlayer2D, or AudioStreamPlayer3D"
	)


static func attach_sfx(
	node: Node,
	audio_stream: AudioStream,
	bus: StringName = "Master",
) -> AudioStreamPlayer:
	var player = AudioStreamPlayer.new()
	player.stream = audio_stream
	player.bus = bus
	node.add_child(player)
	return player


static func attach_sfx_2d(
	node: Node,
	audio_stream: AudioStream,
	bus: StringName = "Master",
) -> AudioStreamPlayer2D:
	var player = AudioStreamPlayer2D.new()
	player.stream = audio_stream
	player.bus = bus
	node.add_child(player)
	return player


static func attach_sfx_3d(
	node: Node,
	audio_stream: AudioStream,
	bus: StringName = "Master",
) -> AudioStreamPlayer3D:
	var player = AudioStreamPlayer3D.new()
	player.stream = audio_stream
	player.bus = bus
	node.add_child(player)
	return player


static func connect_sfx(
	player: Node,
	sig: Signal,
):
	_assert_is_audio_player(player)
	sig.connect(func(...args): player.play())


static func connect_sfx_with_random_pitch(
	player: Node,
	sig: Signal,
	pitch_min: float = 0.975,
	pitch_max: float = 1.025,
):
	_assert_is_audio_player(player)
	sig.connect(func(...args): play_random_pitch(player, pitch_min, pitch_max))


static func play_random_pitch(
	player: Node, pitch_min: float = 0.975, pitch_max: float = 1.025
) -> void:
	_assert_is_audio_player(player)
	player.pitch_scale = randf_range(pitch_min, pitch_max)
	player.play()


# ------------------------------------------------------------------------------


static func attach_and_connect_sfx(
	node: Node,
	audio_stream: AudioStream,
	sig: Signal,
	bus: StringName = "Master",
) -> AudioStreamPlayer:
	var player = attach_sfx(node, audio_stream, bus)
	connect_sfx(player, sig)
	return player


static func attach_and_connect_sfx_random_pitch(
	node: Node,
	audio_stream: AudioStream,
	sig: Signal,
	bus: StringName = "Master",
	pitch_min: float = 0.975,
	pitch_max: float = 1.025,
) -> AudioStreamPlayer:
	var player = attach_sfx(node, audio_stream, bus)
	connect_sfx_with_random_pitch(player, sig, pitch_min, pitch_max)
	return player


static func attach_and_connect_sfx_2d(
	node: Node,
	audio_stream: AudioStream,
	sig: Signal,
	bus: StringName = "Master",
) -> AudioStreamPlayer2D:
	var player = attach_sfx_2d(node, audio_stream, bus)
	connect_sfx(player, sig)
	return player


static func attach_and_connect_sfx_2d_random_pitch(
	node: Node,
	audio_stream: AudioStream,
	sig: Signal,
	bus: StringName = "Master",
	pitch_min: float = 0.975,
	pitch_max: float = 1.025,
) -> AudioStreamPlayer2D:
	var player = attach_sfx_2d(node, audio_stream, bus)
	connect_sfx_with_random_pitch(player, sig, pitch_min, pitch_max)
	return player


static func attach_and_connect_sfx_3d(
	node: Node,
	audio_stream: AudioStream,
	sig: Signal,
	bus: StringName = "Master",
) -> AudioStreamPlayer3D:
	var player = attach_sfx_3d(node, audio_stream, bus)
	connect_sfx(player, sig)
	return player


static func attach_and_connect_sfx_3d_random_pitch(
	node: Node,
	audio_stream: AudioStream,
	sig: Signal,
	bus: StringName = "Master",
	pitch_min: float = 0.975,
	pitch_max: float = 1.025,
) -> AudioStreamPlayer3D:
	var player = attach_sfx_3d(node, audio_stream, bus)
	connect_sfx_with_random_pitch(player, sig, pitch_min, pitch_max)
	return player
