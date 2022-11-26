/// @description Insert description here
// You can write your code in this editor


//Higher smoothing factors increase the smoothness of motion, but eventually leads to camera lagging behind
//Separated smoothing by axis in case game design prefers faster x or y axis camera motion
x += (x_to - x) / x_smoothing_factor;
y += (y_to - y) / y_smoothing_factor;


if (following != noone) 
{
	x_to = following.x;
	y_to = following.y;
}

//clamps ensure that camera never shows beyond the room edges
x = clamp(x, width / 2, room_width - (width / 2));
y = clamp(y, height / 2 , room_height - (height / 2));

var _view_matrix = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, _view_matrix);

//screenshake
shake = power(shake_value,2) * shake_magnitude;

x += random_range(-shake,shake);
y += random_range(-shake,shake);

//reduce shake
if (shake_value > 0) shake_value -= 0.1;

