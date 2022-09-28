/// @description Insert description here
// You can write your code in this editor

state = PlayerStateFree;

key_right = 0;
key_left = 0;
key_up = 0;
key_down = 0;

horizontal_speed = 0;
vertical_speed =0;
_gravity = 0.2;
walk_speed = 4;

tilemap = layer_tilemap_get_id("Collisions")