// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function movement() {
	var _move_dir = key_right - key_left;
	if (!dashing && _move_dir != 0) {
		dash_direction = _move_dir
	}
	
	if state == player_state_air {
		current_acceleration_amt = air_acceleration_amt
		current_deceleration_amt = air_deceleration_amt
		current_speed = air_speed
	} else if state == player_state_dashing {
		current_acceleration_amt = air_acceleration_amt
		current_deceleration_amt = air_deceleration_amt
		current_speed = dash_speed
		
		// Reset movement direction to direction when dash started
		_move_dir = dash_direction
	} else {
		current_acceleration_amt = acceleration_amt
		current_deceleration_amt = deceleration_amt
		current_speed = walk_speed
	}
	
	if (_move_dir == 0) {
		if (mvt_locked == 0) {
			horizontal_speed -= sign(horizontal_speed) * current_deceleration_amt;
			if abs(horizontal_speed) < current_deceleration_amt{
				horizontal_speed = 0;
			}
		}
	} else {//this is literally a clamp...
		
		if(abs(horizontal_speed + (_move_dir * current_acceleration_amt)) < current_speed){
			horizontal_speed += _move_dir * current_acceleration_amt;
		} 
		else horizontal_speed = _move_dir * current_speed;
		if (!against_wall) {facing_x = _move_dir}
	}
}

function movement_while_dashing() {
	
}

function commit_movement() {
	x += horizontal_speed// + environmental_horizontal_speed
	y += vertical_speed //+ environmental_vertical_speed
}
