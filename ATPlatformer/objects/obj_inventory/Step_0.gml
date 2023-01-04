/// @description Insert description here
// You can write your code in this editor
key_right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
key_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
key_select = keyboard_check_pressed(ord("Z")) || mouse_check_button_pressed(mb_left)

/*
if (keyboard_check_pressed(ord("I"))) {
	key_inventory = !key_inventory
} */

if (inventory_active) {
	if (key_right) && (selected_item_index mod ITEM_ROW_LENGTH != ITEM_ROW_LENGTH - 1) selected_item_index++;
	if (key_left) && (selected_item_index mod ITEM_ROW_LENGTH != 0) selected_item_index--;
	if (key_down) && (selected_item_index div ITEM_ROW_LENGTH != (INVENTORY_SIZE-1) div ITEM_ROW_LENGTH) selected_item_index += ITEM_ROW_LENGTH
	if (key_up) && (selected_item_index div ITEM_ROW_LENGTH != 0) selected_item_index -= ITEM_ROW_LENGTH

	for (var i = 0; i < INVENTORY_SIZE; i+=1) {
		var xx = grid_x + (i mod ITEM_ROW_LENGTH) * (ITEM_SPRITE_SIZE + GRID_SPACING) + (GRID_SPACING / 2);
		var yy = grid_y + (i div ITEM_ROW_LENGTH) * (ITEM_SPRITE_SIZE + GRID_SPACING) + (GRID_SPACING / 2);
	
		var mx = (window_mouse_get_x()/window_get_width()) * display_get_gui_width();
		var my = (window_mouse_get_y()/window_get_height()) * display_get_gui_height();
	
		if (mx >= xx) && (mx <= xx+ITEM_SPRITE_SIZE) && (my >= yy) && (my <= yy+ITEM_SPRITE_SIZE)
		{
			selected_item_index = i
		}
	}
	if (key_select) && (inventory[selected_item_index] != -1) {
		inventory[selected_item_index].effect()
	}
}