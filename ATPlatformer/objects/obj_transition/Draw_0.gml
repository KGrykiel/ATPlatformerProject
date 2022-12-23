
if (type == transition.fade) {
	draw_set_color(c_black);
	draw_set_alpha(percent);
	draw_rectangle(0,0,width,height,false);
	draw_set_alpha(1)
}