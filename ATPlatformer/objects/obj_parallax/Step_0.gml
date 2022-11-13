/// @description Insert description here
// You can write your code in this editor


//Parallax scrolling for up to 8 layers.

//
// IMPORTANT
// ---------
// - Backgrounds MUST be named in the form bg_parallex_(x) for 1 <= x <= 8
// - bg(i)_scroll_speed >= bg(i+1)_scroll_speed, otherwise depth illusion breaks.
// - 0 <= bg(i)_scroll_speed <= 1 for backgrounds displayed behind the player / play area
// - bg(i)_scroll_speed > 1 for backgrounds displayed in the foreground (in front of the player)
// - Foreground layers need depth value < depth value of the instance layer containing the player
//


//Since we use view matrices instead of just moving the camera, we have to obtain the current x
//from the view matrix, instead of just calling camera_get_view_x(view_camera[0])
var _camera_x = camera_get_view_mat(view_camera[0])[12];

for(var _i = 0 ; _i < num_backgrounds; _i +=1)
{
	var _current_bg = layer_get_id("bg_parallax_" + string(_i + 1));	
	layer_x(_current_bg, lerp(0, _camera_x, scroll_speeds[_i]) );
}