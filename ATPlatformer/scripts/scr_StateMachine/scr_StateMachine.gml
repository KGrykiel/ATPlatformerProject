// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enableJump(){
	
	if(key_jump)
	{
		vertical_speed = -max_jump_velocity
		jumped = true
	}
}

function PlayerStateFree(){
	
	alarm[0] = -1 // block transition to Air state if we return to the ground during Coyote Time
	
	enableJump()
	
	if (!grounded) {
		if (coyote_time != 0) {
			state = PlayerStateCoyote
			alarm[0] = FRAME_RATE * coyote_time
		}
		else state = PlayerStateAir
	}
	
	scr_collision()
	scr_move()
}

function PlayerStateCoyote(){
	
	enableJump()
	
	if (grounded) {
		state = PlayerStateFree // back to Free state if we return to the ground during Coyote Time
		jumped = false
	}
	
	scr_collision()
	scr_move()
}

function PlayerStateAir(){
	// logic stolen wholesale from Sonic Retro
	// jumped variable ensures this clamping doesn't happen 
	// if the player's moving up for another reason
	if(!key_jump_held && vertical_speed < -min_jump_velocity && jumped) 
	{
		vertical_speed = -min_jump_velocity;
	}
	
	if (grounded) {
		state = PlayerStateFree;
		jumped = false
	}
	
	scr_collision()
	scr_move()
}