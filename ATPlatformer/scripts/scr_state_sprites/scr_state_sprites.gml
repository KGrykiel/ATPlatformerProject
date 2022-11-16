// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information



function spr_state_jumping(){
	var _move_dir = key_right - key_left;
	sprite_index = spr_player_jump
	if _move_dir != 0{
		image_xscale = -sign(_move_dir)
	}
}

function spr_state_walk(){
	var _move_dir = key_right - key_left;
	sprite_index = spr_player_walk
	if _move_dir != 0{
		image_xscale = -sign(_move_dir)
	}
	
}

function spr_state_idle(){
	sprite_index = spr_player_idle
}
