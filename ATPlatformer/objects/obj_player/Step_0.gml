/// @description Insert description here
// You can write your code in this editor

key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
key_jump = keyboard_check_pressed(vk_space);
key_jump_held = keyboard_check(vk_space);
Interact = keyboard_check_pressed(ord("E"));

var move = key_right - key_left;

vertical_speed = vertical_speed + _gravity;

script_execute(state);
show_debug_message(alarm[0])


if ((state == PlayerStateFree) || (state == PlayerStateCoyote)) {
	current_jump = max_jump;
} 

if (state == PlayerStateAir) && (current_jump  > 0) && double_jump {
	current_jump = max_jump - 1
}

if (key_jump) && (current_jump  > 0) && double_jump {
	state = PlayerStateAir
	current_jump -= 1
	vertical_speed = -max_jump_velocity;
}


	