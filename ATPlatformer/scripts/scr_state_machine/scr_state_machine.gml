// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enable_jump(){
	
	if((key_jump /*|| jump_buffer*/) && current_jump > 0)
	{
		time_source_start(_jump_held_time_source)
		//jump_buffer = false
		
		vertical_speed = -max_jump_velocity
		jumped = true
		time_source_stop(jump_buffer_time_source);
		
		if(current_jump > 0)
		{
			current_jump -= 1;
		}
	}
}

function reset_jump(){
	time_source_stop(_jump_held_time_source)
	current_jump = max_jump;
}

function free_player(){
	state = player_state_free // back to Free state if we return to the ground during Coyote Time
	jumped = false
}

function unfree_player(){
	if (coyote_time != 0) {
		state = player_state_coyote
		alarm[0] = FRAME_RATE * coyote_time
	}
	else state = player_state_air
}

function apply_gravity(){
	if (vertical_speed > 0) {
		vertical_speed += down_gravity
		// This speed limit is very generous so we might have to tweak it
		// in the future. We don't want a meteorite player
		vertical_speed = min(vertical_speed + down_gravity, max_down_speed);
	}
	else{
		vertical_speed = vertical_speed + _gravity;
	}
}

function maybe_stop_jumping(){
	// jumped variable ensures this clamping doesn't happen 
	// if the player's moving up for another reason
	if(!key_jump_held && vertical_speed < -min_jump_velocity && jumped) // after a jump, clamp upwards speed
	{
		vertical_speed = -min_jump_velocity;
	}
}

function player_state_free()
{
	reset_jump()
	
	alarm[0] = -1 // block transition to Air state if we return to the ground during Coyote Time
	
	enable_jump()
	jump_buffer = false

	if (!grounded) {
		unfree_player()
	}
	
	if(key_attack) grounded_attack()
	standard_movement()
	
	if(key_interact) 
	{
		var _activateX = x + lengthdir_x(10,direction);
		var _activateY = y + lengthdir_x(10,direction);
		var _activateSize = 4;
		var _activateList = ds_list_create();
		
		activate = noone;
		
		var _entities_found = collision_rectangle_list(
			_activateX - _activateSize,
			_activateY - _activateSize,
			_activateX + _activateSize,
			_activateY + _activateSize,
			obj_interactable,
			false,
			true,
			_activateList,
			true);
		
		while(_entities_found > 0) {
			var _check = _activateList[| --_entities_found];
			if (_check.entityActivateScript != -1) {
				activate = _check;
				break
			}
		}
		// if there is no interactable objects nearby
		if (activate == noone) {
			
		}
		// if there is at least one object to interact with 
		else 
		{
			// activates the script of the object
			script_execute(activate.entityActivateScript);
		}
		
		ds_list_destroy(_activateList);
	}
}

function player_state_coyote(){
	reset_jump()
	
	enable_jump()
	jump_buffer = false
	if (grounded) free_player()
	if(key_attack) air_attack();
	standard_movement()
}

function player_state_air(){
	
	if (key_jump) {
		scr_jump_buffer();
	}
	
	if (current_jump == max_jump) current_jump -= 1;
	enable_jump(); // multi-jump by default, change max_jump to 1 to disable jumping in Air state
	
	maybe_stop_jumping()
	
	if (grounded) free_player()
	
	if(key_attack) air_attack();
	standard_movement()
}

function standard_movement(){
	apply_gravity()
	draw_attack()
	movement()
	scr_collision()
}

function player_state_stun() {
	
}