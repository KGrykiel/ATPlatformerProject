// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_state_sprites(){
	
	var _move_dir = key_left - key_right;
	
	if (_move_dir!=0){
		image_xscale = sign(_move_dir)
	}
	
	switch(state){
		
		case player_state_free:
			if (horizontal_speed != 0){
				sprite_index = spr_player_walk;
			}
			else{
				sprite_index = spr_player_idle;
			}
		break;
		
		case player_state_air:
			sprite_index = spr_player_jump
		break;
	}
}