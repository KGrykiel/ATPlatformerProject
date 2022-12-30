/// @description Insert description here
// You can write your code in this editor


#macro INVENTORY_SIZE 15 // number of items in inventory
#macro ITEM_ROW_LENGTH 5 // number of items per row in grid

#macro ITEM_SPRITE_SIZE 32 // sprite dimensions for item, slot, selection icon, etc.
#macro GRID_SPACING 4 // 2 * gap between slots (therefore accounts for either side)

#macro DESCRIPTION_BOX_WIDTH 64 // width of box provided for item description
#macro DESC_BOX_GRID_GAP 12 // gap between

key_inventory = 0 // to allow inv. display to be brought up
selected_item_index = 0 // records which item is currently being looked at by the player


grid_width = ITEM_ROW_LENGTH * (ITEM_SPRITE_SIZE + GRID_SPACING)
total_width = grid_width + DESCRIPTION_BOX_WIDTH + DESC_BOX_GRID_GAP
grid_height = (ceil(INVENTORY_SIZE/ITEM_ROW_LENGTH)) * (ITEM_SPRITE_SIZE + GRID_SPACING)
	
// used to make sure the inventory layout is centred no matter what the gui is scaled to
grid_x = (display_get_gui_width() - total_width) / 2
grid_y = (display_get_gui_height() - grid_height) / 2

//instance_create_layer(0,0,"Instances",obj_item_manager)
inventory = array_create(INVENTORY_SIZE, -1)
//inventory[0] = global.item_list.dummy

function inventory_search(itemType) {
	for (var i = 0; i < INVENTORY_SIZE; i+=1) {
		if (inventory[i] == itemType) { return i; }
	}
	return -1;
}

function inventory_add(itemType) {
	slot = inventory_search(-1);
	if (slot != -1) {
		inventory[slot] = itemType;
		return true;
	}
	else return false;
}

function inventory_remove(itemType) {
	slot = inventory_search(itemType);
	if (slot != -1) {
		inventory[slot] = -1;
		return true;
	}
	else return false;
}