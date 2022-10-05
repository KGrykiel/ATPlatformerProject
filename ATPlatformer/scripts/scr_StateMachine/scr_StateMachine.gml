// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateFree(){
	
	if(key_jump)
	{
		vertical_speed = -max_jump_velocity
		jumped = true
	}
	
	if (!grounded) state = PlayerStateAir
	
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