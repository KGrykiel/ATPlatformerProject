/// @description Insert description here
// You can write your code in this editor


key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
key_jump = keyboard_check_pressed(vk_space);
key_jump_held = keyboard_check(vk_space);
key_interact = keyboard_check_pressed(ord("E"));
key_attack = mouse_check_button_pressed(mb_left);
key_dash = keyboard_check(vk_shift);
key_inventory = keyboard_check_pressed(ord("I"))
if iframes > 0 iframes--;

if (key_inventory) && 
	(state == player_state_free || state == player_state_inventory_check) {	
	obj_inventory.inventory_active = !obj_inventory.inventory_active
}

grounded = check_collision(0, 1);

// The player can only dash if the dash key is down, the cooldown from previous dashes is complete,
// and the player has hit the ground since the previous dash (want_to_dash is all that needs to be checked
// in other parts of the program)
want_to_dash = key_dash && !dash_cooling && dash_surface_reset;

if (grounded)
{
	// This stores the character's current position in the 'grounded_x' and 'grounded_y' variables.
	// Since these variables are only changed when the character is on ground, they only store the position
	// for when the character was last on ground. These values can then be used to restore the player's position after
	// it falls off a platform into a pit.
	safe_x = x;
	safe_y = y;
	dash_surface_reset = true;
}

if (against_wall) dash_surface_reset = true;


state();

//animations
scr_state_sprites()