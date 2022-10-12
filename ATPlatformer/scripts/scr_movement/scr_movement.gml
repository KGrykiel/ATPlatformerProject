// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function movement() {
	var _move_dir = key_right - key_left; 
	
	if _move_dir == 0 {
		horizontal_speed -= sign(horizontal_speed) * deceleration_amt;
		if abs(horizontal_speed) < deceleration_amt{
			horizontal_speed = 0;
		}
	} else {
		horizontal_speed += _move_dir * acceleration_amt;
		facing_x = _move_dir
	}
	
	horizontal_speed = clamp(horizontal_speed, -walk_speed, walk_speed);

}

function commit_movement() {
	x += horizontal_speed
	y += vertical_speed
}