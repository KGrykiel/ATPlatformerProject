// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateFree(){
	
	if(key_jump)
	{
		vertical_speed = -7
		state = PlayerStateJumping
	}
	
	scr_collision()
}

function PlayerStateJumping(){
	if (check_for_floor()) state = PlayerStateFree;
	scr_collision()
}