/// @description Insert description here
// You can write your code in this editor

if(!movement_finished){
	switch move_dir{
		case MovetDirection.Up:
			y -= move_speed;
		break;
		case MovetDirection.Down:
			y += move_speed;
		break;
		case MovetDirection.Left:
			x -= move_speed;
		break;
		case MovetDirection.Right:
			x += move_speed;
		break;
		default:
			// move upwards instead of error
			y -= move_speed;
	}
	moved_distance += move_speed;
	movement_finished = moved_distance >=  move_distance
}


