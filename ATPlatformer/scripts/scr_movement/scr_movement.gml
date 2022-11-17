// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function movement() {
	var _move_dir = key_right - key_left;
	
	if state == player_state_air {
		current_acceleration_amt = air_acceleration_amt
		current_deceleration_amt = air_deceleration_amt
		current_speed = air_speed
	} else {
		current_acceleration_amt = acceleration_amt
		current_deceleration_amt = deceleration_amt
		current_speed = walk_speed
	}
	
	if (_move_dir == 0 || abs(horizontal_speed) > current_speed) {
		if (mvt_locked == 0) {
			horizontal_speed -= sign(horizontal_speed) * current_deceleration_amt;
			if abs(horizontal_speed) < current_deceleration_amt{
				horizontal_speed = 0;
			}
		}
	} else{
		
		horizontal_speed += _move_dir * current_acceleration_amt;
		horizontal_speed = clamp(horizontal_speed, -current_speed,current_speed);
		
		if (!against_wall) {facing_x = _move_dir}
	}
}

function commit_movement() {
	x += horizontal_speed// + environmental_horizontal_speed
	y += vertical_speed //+ environmental_vertical_speed
}
