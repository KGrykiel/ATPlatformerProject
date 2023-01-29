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
			dash_direction = dash_direction * -1
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
	// If coyote_time enabled, and not coming out of a dash, enter coyote state
	if (coyote_time != 0) {
		state = player_state_coyote
		alarm[0] = FRAME_RATE * coyote_time
	}
	// Else no jump resets
	else state = player_state_air
}

function apply_gravity(){
	if (vertical_speed > 0) {
		vertical_speed += down_gravity
		// This speed limit is very generous so we might have to tweak it
		// in the future. We don't want a meteorite player
		vertical_speed = min(max(vertical_speed + down_gravity,1), max_down_speed);
	}
	else {
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
	} else if (want_to_dash) {
		begin_dashing()
	}
	
	if(key_attack) grounded_attack()

	standard_movement()
	interact()
	
	if(obj_inventory.inventory_active) {
		state = player_state_inventory_check
		sprite_index = spr_player_idle
		horizontal_speed = 0;
	}
	
	//TODO: probably make it into a seperate method like stop_player or something
	//looks kinda messy like this
	if(instance_exists(obj_textbox))
	{ 
		state = player_state_dialogue 
		sprite_index = spr_player_idle;
		horizontal_speed = 0;
	}
}

function player_state_coyote(){
	reset_jump()
	
	enable_jump()
	jump_buffer = false
	if (grounded) {
		free_player();
	} else if (want_to_dash) {
		begin_dashing()
	}
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
	
	if (grounded) {
		free_player();
	} else if (want_to_dash) {
		begin_dashing()
	}
	
	if (against_wall && vertical_speed >= 0) {
		state = player_state_against_wall;
	}
	
	if(key_attack) air_attack();
	standard_movement()
}

function begin_dashing() {
	// Used for debug
	// time_spent_dashing = 0.0;
	
	// Amount of time for which the dash will continue
	dash_energy = dash_distance;
	
	alarm[2] = FRAME_RATE * dash_cooldown;
	vertical_speed = 0
	horizontal_speed = dash_speed * dash_direction
	dashing = true
	dash_cooling = true // dashing disabled until cooldown completed
	dash_ground_reset = false // dashing disabled until player hits the ground
	state = player_state_dashing;
}

function player_state_dashing() {
	// Used for debug
	// time_spent_dashing += delta_time / 1000000;
	// show_debug_message(string(t) + " " + string(dash_energy) + " " + string(y));
	
	vertical_speed = 0
	dash_energy -= dash_speed * delta_time / 1000000;
	dash_movement()
	
	// Creating the trail effect
	with (instance_create_depth(x,y,depth+1, obj_player_dash_trail)) {
		trail_removal_rate = 0.05;
		sprite_index = other.sprite_index;
		image_alpha = 0.7;
	}
	
	// Checks if the player has collided with a wall, and alters state
	if (against_wall) {
		dashing = false
		state = player_state_against_wall
	}
	// If dash energy depleted (full dash is complete) stop dashing and work out new state
	else if (dash_energy <= 0) {
		dashing = false;
		// Either returns to free state, or some other unfree state

		// Stops you from dashing a second time in midair if you had some contact with the ground
		// but are now midair
		dash_ground_reset = false;

		if (grounded) {
		    state = player_state_free;
		} else {
		    state = player_state_air;
		}
	}
	// show_debug_message("DASHING NOW")
}

function standard_movement(){
	apply_gravity()
	draw_attack()
	movement()
	//scr_collision()
	check_for_wall()
	//commit_movement()
}

function dash_movement(){
	//apply_gravity()
	draw_attack()
	movement()
	scr_collision()
	check_for_wall()
}

function player_state_against_wall() {
	vertical_speed = wall_sliding_speed
	
	// could optionally reset dash on wall collisions (would change name to dash_surface_reset)
	// dash_ground_reset = true
	
	reset_jump()
	
	enable_jump()
	
	if (grounded) {
		state = player_state_free;
	}
	if (!against_wall) {
		state = player_state_air 
	}
	
	standard_movement()
}

function player_state_stun() {
	
}

function player_state_dialogue() {
	if(!instance_exists(obj_textbox)){ free_player() }
}

function player_state_transition(){
}

function player_state_inventory_check() {
	if (!obj_inventory.inventory_active) {
		free_player()
		//obj_inventory.inventory_active = false
	}
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

// Debugger function used to work out which state you're in when called:
function state_check_debug() {
	if (state == player_state_against_wall) {show_debug_message("AGAINST_WALL")}
	if (state == player_state_air) {show_debug_message("AIR")}
	if (state == player_state_coyote) {show_debug_message("COYOTE")}
	if (state == player_state_dashing) {show_debug_message("DASH")}
	if (state == player_state_dialogue) {show_debug_message("DIALOGUE")}
	if (state == player_state_free) {show_debug_message("FREE")}
	if (state == player_state_stun) {show_debug_message("STUN")}
	if (state == player_state_transition) {show_debug_message("TRANSITION")}
}