// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enableJump(){
	
	if((key_jump || jump_buffer) && current_jump > 0)
	{
		state = PlayerStateAir
		jump_buffer = false
		
		vertical_speed = -max_jump_velocity
		jumped = true
		time_source_stop(jump_buffer_time_source);
		
		if(current_jump  > 0)
		{
			current_jump -= 1;
		}
	}
}

function PlayerStateFree(){
	current_jump = max_jump;
	
	alarm[0] = -1 // block transition to Air state if we return to the ground during Coyote Time
	//horizontal_speed = 5
	
	enableJump()
	jump_buffer = false

	if (!grounded) {
		if (coyote_time != 0) {
			state = PlayerStateCoyote
			alarm[0] = FRAME_RATE * coyote_time
		}
		else state = PlayerStateAir
	}
	
	if(key_attack) grounded_attack()
	draw_attack()
	movement()
	scr_collision()
	commit_movement()
}

function PlayerStateCoyote(){
	current_jump = max_jump;
	
	enableJump()
	jump_buffer = false
	
	if (grounded) {
		state = PlayerStateFree // back to Free state if we return to the ground during Coyote Time
		jumped = false
	}
	
	if(key_attack) air_attack();
	draw_attack()
	movement()
	scr_collision()
	commit_movement()
}

function PlayerStateAir(){
	
	if (key_jump) {
		scr_jump_buffer();
	}
	
	if (current_jump == max_jump) current_jump -= 1;
	enableJump(); // multi-jump by default, change max_jump to 1 to disable jumping in Air state
	
	// logic stolen wholesale from Sonic Retro
	// jumped variable ensures this clamping doesn't happen 
	// if the player's moving up for another reason
	if(!key_jump_held && vertical_speed < -min_jump_velocity && jumped) 
	{
		vertical_speed = -min_jump_velocity;
	}
	
	if (vertical_speed > 0) {
	// This speed limit is very generous so we might have to tweak it
	// in the future. We don't want a meteorite player
	vertical_speed = min(vertical_speed + down_gravity, max_down_speed);
	}

	
	if (grounded) {
		state = PlayerStateFree;
		jumped = false
	}
	
	if(key_attack) air_attack();
	draw_attack()
	movement()
	scr_collision()
	commit_movement()
}
