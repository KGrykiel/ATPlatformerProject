/// @description Insert description here
// You can write your code in this editor

grounded_movement = function() {
	var _move_dir = key_right - key_left; 
	
	if _move_dir == 0 {
		horizontal_speed -= sign(horizontal_speed) * deceleration_amt;
		if abs(horizontal_speed) < deceleration_amt{
			horizontal_speed = 0;
		}
	} else {
		horizontal_speed += _move_dir * acceleration_amt;
	}
	
	horizontal_speed = clamp(horizontal_speed, -walk_speed, walk_speed);
	
	x += horizontal_speed
	y += vertical_speed
}

function manage_attack() {
	if keyboard_check_pressed(ord("E")) and attack_sequence == noone {
		attack_sequence = layer_sequence_create("Sequences", x, y, seq_attack);
	} else {
		layer_sequence_x(attack_sequence, x);
		layer_sequence_y(attack_sequence, y);
		layer_sequence_xscale(attack_sequence, image_xscale);
	}
}

state = PlayerStateFree

key_right = 0;
key_left = 0;
key_up = 0;
key_down = 0;

horizontal_speed = 0;
vertical_speed =0;
_gravity = 0.2;
down_gravity = 0.2;
walk_speed = 4;
max_jump_velocity = 7;
min_jump_velocity = 4;
max_down_speed = 50;



acceleration_period = 60; // no. of frames to accelerate from 0 to max_speed
deceleration_period = 30; // no. of frames to decelerate from max_speed to 0
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