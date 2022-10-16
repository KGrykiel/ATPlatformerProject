/// @description Insert description here
// You can write your code in this editor

state = PlayerStateFree

key_right = 0;
key_left = 0;
key_up = 0;
key_down = 0;
key_jump = 0;
key_jump_held = 0;
key_interact = 0;
key_attack = 0;

horizontal_speed = 0;
vertical_speed =0;
_gravity = 0.2;
down_gravity = 0.2;
walk_speed = 4;
max_jump_velocity = 7;
min_jump_velocity = 4;
max_down_speed = 50;



acceleration_period = 12; // no. of frames to accelerate from 0 to max_speed
deceleration_period = 6; // no. of frames to decelerate from max_speed to 0
acceleration_amt = walk_speed / acceleration_period;
deceleration_amt = walk_speed / deceleration_period;

// show_debug_message(acceleration_amt)

x_acc = 0

tilemap = layer_tilemap_get_id("Collisions")
grounded = true
jumped = false


max_jump = 2; 
current_jump = 0;
double_jump = true;

coyote_time = 0.5

attack_sequence = noone;
facing_x = 1
knockback_force = 50;
knockback_dir_x = 1;
knockback_dir_y = 0;