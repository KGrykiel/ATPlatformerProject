/// @description Insert description here
// You can write your code in this editor
show_debug_message("Collide with player" + string(self.is_dashing))
var block_x = x;
if(self.is_dashing && !self.movement_finished){
	with (obj_player) {
		if iframes <= 0 {
			scr_damage(1);
			var react_dir = obj_player.x >= block_x ? 1 : -1;
			obj_player.x = block_x + 50 * react_dir;
			//horizontal_speed = sign(x - other.x) *10
			//vertical_speed = -5
			iframes = 60;
		}
	}
}