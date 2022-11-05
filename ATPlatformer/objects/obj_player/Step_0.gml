/// @description Insert description here
// You can write your code in this editor


key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
key_jump = keyboard_check_pressed(vk_space);
key_jump_held = keyboard_check(vk_space);
key_interact = keyboard_check_pressed(ord("E"));
key_attack = mouse_check_button_pressed(mb_left)

grounded = check_collision(0, 1);

environmental_horizontal_speed = 0;
environmental_vertical_speed = 0;

if (grounded)
{
	// This stores the character's current position in the 'grounded_x' and 'grounded_y' variables.
	// Since these variables are only changed when the character is on ground, they only store the position
	// for when the character was last on ground. These values can then be used to restore the player's position after
	// it falls off a platform into a pit.
	safe_x = x;
	safe_y = y;
}

script_execute(state);

// updates movement lock countdown
mvt_locked = max(0, mvt_locked - 1);
if (grounded) mvt_locked = 0;

//show_debug_message(facing_x)
//show_debug_message(mvt_locked)
show_debug_message(vertical_speed)

//walking animation code
if (horizontal_speed != 0 || vertical_speed != 0){
	image_speed = horizontal_speed/3
}
else{
	image_speed = 0
}
	
	