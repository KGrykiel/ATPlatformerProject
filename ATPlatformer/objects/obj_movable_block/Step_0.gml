/// @description Insert description here
// You can write your code in this editor

if(!movement_finished){
	var speed_coefficient = 1
	if(is_dashing){
		speed_coefficient = dashing_speed
	}
	move_amount = move_speed * speed_coefficient;
	switch move_dir{
		case MovetDirection.Up:
			y -= move_amount;
		break;
		case MovetDirection.Down:
			y += move_amount;
		break;
		case MovetDirection.Left:
			x -= move_amount;
		break;
		case MovetDirection.Right:
			x += move_amount;
		break;
		default:
			// move upwards instead of error
			y -= move_amount;
			break;
	}
	moved_distance += move_amount;
	movement_finished = moved_distance >=  move_distance
}else{
	if(repeat_move){
		time_wait += 1
		if(!is_dashing){
			time_wait += rest_time;
			}
		if(time_wait >= rest_time){
			var new_destination = is_forward ? start_location : end_location;
			switch(move_dir){
				case MovetDirection.Up:
					move_dir = MovetDirection.Down
					move_distance = abs(y - new_destination[1])
					break;
				case MovetDirection.Down:
					move_dir = MovetDirection.Up
					move_distance = abs(y - new_destination[1])
					break;
				case MovetDirection.Left:
					move_dir = MovetDirection.Right
					move_distance = abs(x - new_destination[0])
					break;
				case MovetDirection.Right:
					move_dir = MovetDirection.Left
					move_distance = abs(x - new_destination[0])
					break;
				default:
					move_dir = MovetDirection.Down
					move_distance = abs(y - new_destination[1])
					break;
			}
			is_dashing = !is_dashing;
			movement_finished = false;
			moved_distance = 0;
			is_forward = !is_forward;
			time_wait = 0
			
			
		}
	}
}



