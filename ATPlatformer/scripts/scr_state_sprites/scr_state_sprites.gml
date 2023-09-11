// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_state_sprites(){
	
	
	if (facing_x!=0){
		image_xscale = sign(facing_x)
	}
	
	switch(state){
		
		case player_state_free:
			if (horizontal_speed != 0){
				sprite_index = spr_newplayer_walk;
			}
			else{
				sprite_index = spr_newplayer_idle;
			}
		break;
		
		case player_state_air:
			sprite_index = spr_newplayer_jump
		break;
		
		case player_state_against_wall:
			sprite_index = spr_newplayer_walljump
		break;
		
		default:
			sprite_index = spr_newplayer_idle;
		break;
	}
}