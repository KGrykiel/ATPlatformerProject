// All functions associated with attacks

/// @desc Creates a new projectile, returning its id
/// @param {real} _initial_direction  Direction the projectile is fired in degrees clockwise from right
/// @param {array} _immune_characters  id of all characters (have 'obj_character' as parent) which are not affected by projectile (should include object which created it)
function scr_create_projectile(_initial_direction=0, _immune_characters=[], _initial_speed=5, _initial_x=0, _initial_y=0) {
	_projectile_id = instance_create_layer(_initial_x, _initial_y, "Instances", obj_projectile,
	{
		initial_direction : _initial_direction,
		initial_speed : _initial_speed,
		immune_characters : _immune_characters
	});
	return _projectile_id
}