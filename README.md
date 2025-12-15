# Bryton's GDScript Utils

A collection of utility scripts written in GDScript for Godot 4. This addon contains various helper functions and utilities that I constantly reuse and copy/paste between different projects. Over time, the collection grew large enough to extract into its own addon for better reusability.

## Status

**Active maintenance is not planned.** This is primarily a personal utility collection that I'm sharing with the community. Feel free to use it, fork it, or adapt it to your needs.

## Installation

1. Download this repository
2. Copy the `lebriton.godot_utils` folder to your project's `addons/` directory
3. Enable the addon in Project Settings → Plugins

## Utilities

The addon includes utilities in the following categories:

### Static Utils (`static/utils/`)
- **ArrayUtils**: Array manipulation and helper functions
- **CameraUtils**: Camera-related utilities
- **ControlUtils**: UI Control node helpers
- **DictUtils**: Dictionary manipulation utilities
- **FuncUtils**: Function-related helpers
- **GeometryUtils**: Geometric calculations and helpers
- **GroupUtils**: Scene tree group management
- **MaterialUtils**: Material manipulation utilities
- **MetaUtils**: Metadata and reflection helpers
- **NodeUtils**: Node tree manipulation and helpers
- **StringUtils**: String processing utilities
- **TweenUtils**: Tween animation helpers
- **VectorUtils**: Vector math utilities
- **Vector2Utils**: 2D vector-specific utilities

### Types (`types/`)
- **Types**: Common type definitions
- **ValueChangeResult**: Result type for value change operations

## Usage

All utilities are available as static classes. For example:

```gdscript
# Add a node after a specific sibling
NodeUtils.add_child_after(parent, new_node, existing_node)

# Convert 2D vector to 3D vector
var vec3 = VectorUtils.vec2_to_3(Vector2(10, 5))

# Compute aligned offset to center content
var offset = GeometryUtils.compute_aligned_offset(Types.AnchorsPreset CENTER, Vector2(100, 50))
```

## License

See LICENSE file for details.

## Contributing

While this isn't actively maintained, feel free to submit issues or pull requests if you find bugs or want to add useful utilities that align with the project's style and purpose.
