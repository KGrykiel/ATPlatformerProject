/// @description Insert description here
// You can write your code in this editor
var block_x = x + (sprite_width / 2);
if(self.is_dashing && !self.movement_finished){
	with (obj_player) {
		if iframes <= 0 {
			show_debug_message(x)
			scr_damage(1);
			var react_dir = (x >= block_x) ? 1 : -1;
			show_debug_message(block_x)
			show_debug_message(react_dir)
			x = block_x + ((other.sprite_width/2 + 20) * react_dir);
			//horizontal_speed = sign(x - other.x) *10
			//vertical_speed = -5
			iframes = 60;
		}
	}
}