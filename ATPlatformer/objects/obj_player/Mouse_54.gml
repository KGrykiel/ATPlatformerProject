/// @description Shoots projectile if also pressing shift

if keyboard_check(vk_shift) {
	// Shoots starting from roughly hands of player (30 above feet)
	var _delta_x = mouse_x - x;
	var _delta_y = mouse_y - (y-30);
	scr_create_projectile(scr_vector_to_direction(_delta_x,_delta_y),[id],,x,y-30);
	if projectile_knockback {
		show_debug_message("ABC")
		if _delta_x < 0 {
			horizontal_speed += 4;
			vertical_speed -= 1
		}
		else {
			horizontal_speed -= 4;
			vertical_speed -= 1;
		}
	}
}