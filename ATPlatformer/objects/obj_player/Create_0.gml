/// @description Insert description here
// You can write your code in this editor

function attack_horizontal() {
	obj_player.attack_sequence = layer_sequence_create("Sequences", x, y, seq_attack);
	call_later(10, time_source_units_frames, end_attack);
	layer_sequence_xscale(attack_sequence, facing_x);
	knockback_dir_x = -facing_x;
	knockback_dir_y = 0;
}

function attack_up() {
	attack_sequence = layer_sequence_create("Sequences", x, y, seq_attack_up);
	call_later(10, time_source_units_frames, end_attack);
	knockback_dir_x = 0;
	knockback_dir_y = 1;
}

function attack_down() {
	attack_sequence = layer_sequence_create("Sequences", x, y, seq_attack_down);
	call_later(10, time_source_units_frames, end_attack);
	knockback_dir_x = 0;
	knockback_dir_y = -1;
}

function grounded_attack() {
	if (attack_sequence != noone) return;
	if key_up {
		attack_up();
	} else {
		attack_horizontal();
	}
}

function air_attack() {
	if (attack_sequence != noone) return;
	if key_up {
		attack_up();
	} else if key_down {
		attack_down();
	} else {
		attack_horizontal();
	}
}

function draw_attack() 
{
	if attack_sequence == noone return;
		layer_sequence_x(attack_sequence, x);
		layer_sequence_y(attack_sequence, y);
	
}

function end_attack() {
	layer_sequence_destroy(attack_sequence);
	attack_sequence = noone;
}

function attack_knockback() {
	horizontal_speed += knockback_dir_x * knockback_force_x;
	if (knockback_dir_y != 0) {vertical_speed = knockback_dir_y * knockback_force_y;}
	knockback_dir_x = 0;
	knockback_dir_y = 0;
}

state = player_state_free

key_right = 0;
key_left = 0;
key_up = 0;
key_down = 0;

horizontal_speed = 0;
vertical_speed =0;
_gravity = 0.2;
down_gravity = 0.2;
walk_speed = 4;
air_speed = 4;
max_jump_velocity = 7;
min_jump_velocity = 4;
max_down_speed = 50;



acceleration_period = 12; // no. of frames to accelerate from 0 to max_speed
air_acceleration_period = 20; // no. of frames to accelerate from 0 to max_speed

deceleration_period = 6; // no. of frames to decelerate from max_speed to 0
air_deceleration_period = 10; // no. of frames to decelerate from max_speed to 0

acceleration_amt = walk_speed / acceleration_period;
air_acceleration_amt = air_speed / air_acceleration_period;

deceleration_amt = walk_speed / deceleration_period;
air_deceleration_amt = air_speed / air_deceleration_period;

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
knockback_force_x = 4;
knockback_force_y = 4;
knockback_dir_x = 1;
knockback_dir_y = 0;