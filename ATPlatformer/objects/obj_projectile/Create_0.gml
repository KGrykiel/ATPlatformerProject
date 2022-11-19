/// @description Variable descriptions

// imuune characters: Id of all characters (have 'obj_character' as parent) which are not affected by projectile (should include object which created it)
// gravity_strength: Strength of gravity - set to 0 for no gravity
// initial_speed/direction: Speed/direction of projectile when created
// decay_time: Time before the projectile dissapears (disable by setting to 0)
 
// Calculates initial horizontal and vertical speed
horizontal_speed = initial_speed * cos(degtorad(initial_direction));
vertical_speed = (initial_speed * sin(degtorad(initial_direction)));

gravity = gravity_strength;

if decay_time > 0 {
	alarm[0] = decay_time * FRAME_RATE;
}