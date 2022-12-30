/// @description Insert description here
// You can write your code in this editor

// this will probably change later
//display_set_gui_size(320,180)

if (key_inventory) {
	// code I stole to draw inventory grid w/ bg
	// inventory background
	draw_sprite_stretched(spr_inventory_bg, 0, 
							grid_x, grid_y, // top left corner coordinates
							grid_width, 
							grid_height) 
							// x and y values for size of grid: here, 36 is chosen 
							// because 32x32 is the current item sprite size (2 pixels gap on either side)

	// item slots
	for (var i = 0; i < INVENTORY_SIZE; i+=1) {
		var xx = grid_x + (i mod ITEM_ROW_LENGTH) * (ITEM_SPRITE_SIZE + GRID_SPACING) + (GRID_SPACING / 2);
		var yy = grid_y + (i div ITEM_ROW_LENGTH) * (ITEM_SPRITE_SIZE + GRID_SPACING) + (GRID_SPACING / 2);
		
		draw_sprite(spr_slot,0,xx,yy)
		
		/*if (mx >= xx) && (mx <= xx+ITEM_SPRITE_SIZE) && (my >= yy) && (my <= yy+ITEM_SPRITE_SIZE) {
			draw_sprite(spr_selection,0,xx,yy)
		}*/
	
		if (inventory[i] != -1) {
			draw_sprite(inventory[i].sprite,0,xx,yy)	
		}
	}
	
	var xx = grid_x + (selected_item_index mod ITEM_ROW_LENGTH) * (ITEM_SPRITE_SIZE + GRID_SPACING) + (GRID_SPACING / 2);
	var yy = grid_y + (selected_item_index div ITEM_ROW_LENGTH) * (ITEM_SPRITE_SIZE + GRID_SPACING) + (GRID_SPACING / 2);
	draw_sprite(spr_selection,0,xx,yy)
	
	// description box
	var desc_box_x = grid_x + grid_width + DESC_BOX_GRID_GAP
	var desc_box_y = grid_y
	draw_sprite_stretched(spr_inventory_bg, 0, 
							desc_box_x,
							desc_box_y,
							DESCRIPTION_BOX_WIDTH,
							grid_height)
	if (inventory[selected_item_index] != -1) {
		draw_text(desc_box_x, desc_box_y, inventory[selected_item_index].name)
		draw_text(desc_box_x, desc_box_y + 64, inventory[selected_item_index].description)
	}
}