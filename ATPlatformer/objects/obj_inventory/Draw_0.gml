/// @description Insert description here
// You can write your code in this editor
/*
// code I stole to draw inventory grid w/ bg

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
	
	if (mouse_x >= xx) && (mouse_x <= xx+32) && (mouse_y >= yy) && (mouse_y <= yy+32) {
		selected_item = i;
		draw_sprite(spr_red_square_opaque,0,xx,yy)
	}
	else draw_sprite(spr_slot,0,xx,yy)
	
	if (inventory[i] != -1) {
		draw_sprite(inventory[i].sprite,0,xx,yy)	
	}
	show_debug_message(mouse_x >= xx)
}*/