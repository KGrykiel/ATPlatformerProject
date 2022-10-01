// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateFree(){
	
	if(key_jump)
	{
		vertical_speed = -jump_height
	}
	
	if (!grounded) state = PlayerStateAir
	
	scr_collision()
	scr_move()
}

function PlayerStateAir(){
	if (grounded) state = PlayerStateFree;
	scr_collision()
	scr_move()
}