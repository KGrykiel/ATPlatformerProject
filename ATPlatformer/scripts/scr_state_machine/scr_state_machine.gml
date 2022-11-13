// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enable_jump(){
	
	if((key_jump /*|| jump_buffer*/) && current_jump > 0)
	{
		time_source_start(_jump_held_time_source)
		//jump_buffer = false
		
		vertical_speed = -max_jump_velocity
		jumped = true
		
		// make character face opposite direction, push them off the wall and restrict their 
		// movement so they can't stay stuck to the wall
		if (against_wall && !grounded) {
			against_wall = false
			facing_x = facing_x * -1
			horizontal_speed = air_speed * facing_x
			mvt_locked = mvt_lock_countdown_max
		}
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

function player_state_free(){
	reset_jump()
	
	alarm[0] = -1 // block transition to Air state if we return to the ground during Coyote Time
	
	enable_jump()
	jump_buffer = false

	if (!grounded) {
		unfree_player()
	}
	
	if(key_attack) grounded_attack()

	standard_movement()
	interact()
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
	
	if (against_wall && vertical_speed >= 0) {
		state = player_state_against_wall;
	}
	
	if(key_attack) air_attack();
	standard_movement()
}

function standard_movement(){
	apply_gravity()
	draw_attack()
	movement()
	scr_collision()
	check_for_wall()
	//commit_movement()
}

function player_state_against_wall() {
	vertical_speed = wall_sliding_speed
	reset_jump()
	
	enable_jump()
	
	if (grounded) { state = player_state_free }
	if (!against_wall) {
		state = player_state_air 
	}
	
	standard_movement()
}

function player_state_stun() {
}

function interact() {
		if (key_interact)
	{
		//1. check for an entity to activate
		//2. if there is nothing, or there is something, but it has no script - do nothing I guess.
		//3. otherwise, there is something and it has a script! Activate!
		//4. If the thing is an NPC, might as well do something more
		
		var _activate_x = x + lengthdir_x(10,direction); //change constant to alter length of activation
		var _activate_y = y + lengthdir_y(10,direction);
		var _activate_size = 4;
		var _activate_list = ds_list_create();
		activate = noone;
		var _entities_found = collision_rectangle_list(
			_activate_x - _activate_size,
			_activate_y - _activate_size,
			_activate_x + _activate_size,
			_activate_y + _activate_size,
			obj_interactable,
			false,
			true,
			_activate_list,
			true
		);
		
		// if the first instance we find has no script, try the next one
		while (_entities_found>0)
		{
			var _check = _activate_list[| --_entities_found];
			if (_check.entity_activate_script !=-1)
			{
				activate = _check;
				break;
			}
				
		}
		
		ds_list_destroy(_activate_list)
		
		if (activate == noone)
		{
			//do nothing, might add a sound effect or something later idk.
		}
		else
		{
			// activate the entity
			script_execute_array(activate.entity_activate_script,activate.entity_activate_args);
			
		}
		
	
	}
}