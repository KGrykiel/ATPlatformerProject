if (type == transition.fade) {
	draw_set_color(c_black);
	draw_set_alpha(percent);
	var _xx, _yy, _w, _h;
	_xx = camera_get_view_x(view_get_camera(view_current))
	_yy = camera_get_view_y(view_get_camera(view_current))
	_w = camera_get_view_width(view_get_camera(view_current))
	_h = camera_get_view_height(view_get_camera(view_current))

	draw_rectangle(_xx, _yy, _w, _h, false)
}