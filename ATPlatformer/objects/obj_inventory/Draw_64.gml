/// @description Insert description here
// You can write your code in this editor

// this will probably change later
//display_set_gui_size(320,180)

if (inventory_active) {
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
							
	// name and description text
	if (inventory[selected_item_index] != -1) {
		draw_set_halign(fa_left)
		draw_set_font(fnt_dialogue)
		var name = scr_wrap_text(inventory[selected_item_index].name, DESCRIPTION_BOX_WIDTH - DESCRIPTION_TEXT_SPACING, "\n", false)
		draw_text(desc_box_x + DESCRIPTION_TEXT_SPACING, desc_box_y + DESCRIPTION_TEXT_SPACING, name)
		var name_height = string_height(name)
		
		draw_set_font(fnt_debug)
		var desc = scr_wrap_text(inventory[selected_item_index].description, DESCRIPTION_BOX_WIDTH - DESCRIPTION_TEXT_SPACING, "\n", false)
		draw_text(desc_box_x + DESCRIPTION_TEXT_SPACING, desc_box_y + name_height + DESCRIPTION_TEXT_SPACING, desc)
	}
}