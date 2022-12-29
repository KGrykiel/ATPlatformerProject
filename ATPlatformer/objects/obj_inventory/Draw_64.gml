/// @description Insert description here
// You can write your code in this editor

if (key_inventory) {
	// code I stole to draw inventory grid w/ bg
	//show_debug_message(display_get_gui_height())
	// inventory background
	draw_sprite_stretched(spr_inventory_bg, 0, 
							grid_x, grid_y, // top left corner coordinates
							rowLength*36, (ceil(INVENTORY_SIZE/rowLength)) * 36) 
							// x and y values for size of grid: here, 36 is chosen 
							// because 32x32 is the current item sprite size (2 pixels gap on either side)

	// item slots
	for (var i = 0; i < INVENTORY_SIZE; i+=1) {
		var xx = grid_x + (i mod rowLength) * 36 + 2;
		var yy = grid_y + (i div rowLength) * 36 + 2;
	
		var mx = (window_mouse_get_x()/window_get_width()) * display_get_gui_width();
		var my = (window_mouse_get_y()/window_get_height()) * display_get_gui_height();
	
		if (mx >= xx) && (mx <= xx+32) && (my >= yy) && (my <= yy+32) {
			draw_sprite(spr_red_square_opaque,0,xx,yy)
		}
		else draw_sprite(spr_slot,0,xx,yy)
	
		if (inventory[i] != -1) {
			draw_sprite(inventory[i].sprite,0,xx,yy)	
		}
	}
}