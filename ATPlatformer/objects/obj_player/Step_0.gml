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
if iframes > 0 iframes--;

//var move = key_right - key_left;

script_execute(state);
