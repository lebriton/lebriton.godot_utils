# AGENTS.md

## Build/Test Commands
This is a Godot plugin with no automated tests. Use Godot Editor to validate functionality.

## Code Style Guidelines

### File Structure
- Utility classes in `static/utils/` with `class_name XUtils extends Node/Object`
- Types in `types/` with `class_name Types extends Object`
- Plugin entry point: `lebriton.godot_utils.gd` extends EditorPlugin

### Naming Conventions
- Classes: PascalCase with `class_name` (e.g., `ArrayUtils`, `StringUtils`)
- Functions: snake_case (e.g., `enumerate_duplicates`, `find_next_item`)
- Variables: snake_case (e.g., `current_index`, `total_counts`)
- Constants: UPPER_SNAKE_CASE (e.g., `SEPARATOR`)

### GDScript Patterns
- Use `static func` for utility methods
- Type hints with `:` for parameters and `:=` for inferred variables
- Use `assert()` for validation in static methods
- Return `null` for "not found" cases
- Use `extends Node` for utilities needing scene tree, `extends Object` for pure logic

### Imports & Dependencies
- No explicit imports needed for built-in types
- Use `extends RefCounted` for data classes
- Prefer `Callable` over function pointers

### Error Handling
- Use `assert()` for developer errors
- Return `null` or empty collections for invalid states
- Use `clamp()` for boundary validation