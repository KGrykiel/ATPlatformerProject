/// @description Insert description here
// You can write your code in this editor

enum MovetDirection {
	Up,
	Down,
	Left,
	Right,
}
start_location = [x,y]
end_location = [x,y]
is_forward = true
movement_finished = false
moved_distance = 0;
time_wait = 0
switch move_dir{
	case MovetDirection.Up:
		end_location = [x, y-move_distance]
		break;
	case MovetDirection.Down:
		end_location = [x, y+move_distance]
		break;
	case MovetDirection.Left:
		end_location = [x+move_distance, y]
		break;
	case MovetDirection.Right:
		end_location = [x-move_distance, y]
		break;
	default:
		end_location = [x, y-move_distance];
}
