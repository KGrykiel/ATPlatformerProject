/// @description Insert description here
// You can write your code in this editor
event_inherited()
_enable_gravity_while_jumping = true
scr_create_health_vars(20,10)


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

function dash() {
	show_debug_message("dashing!");
}


function dead_state() {
	room_restart();
}

//state declaration
state = player_state_free

//key declaration
key_right = 0;
key_left = 0;
key_up = 0;
key_down = 0;
key_jump = 0;
key_jump_held = 0;
key_interact = 0;
key_inventory = 0;
key_attack = 0;
key_dash = 0;

//Velocty components for player input
horizontal_speed = 0;
vertical_speed = 0;
//Velocity components for movement induced by the environment
environmental_horizontal_speed = 0;
environmental_vertical_speed = 0;
_gravity = 0.5;

//down gravity
down_gravity = 0.52;
max_down_speed = 20;

//speed
walk_speed = 5;
air_speed = 5;
// for dash speed, see the dash parameters section

//variable jumping heights
max_jump_velocity = 11;
min_jump_velocity = 3;

//Acceleration and deceleration
acceleration_period = 12; // no. of frames to accelerate from 0 to max_speed
air_acceleration_period = 6; // no. of frames to accelerate from 0 to max_speed

deceleration_period = 6; // no. of frames to decelerate from max_speed to 0
air_deceleration_period = 10; // no. of frames to decelerate from max_speed to 0

acceleration_amt = walk_speed / acceleration_period;
air_acceleration_amt = air_speed / air_acceleration_period;

deceleration_amt = walk_speed / deceleration_period;
air_deceleration_amt = air_speed / air_deceleration_period;

// wall jump variables
wall_jump_enabled = true;
wall_sliding_speed = 1;
against_wall = false;
// if the character's movement is intended to be locked for some duration
wall_propulsion_speed = 7;

x_acc = 0

grounded = true
jumped = false
dashing = false
dash_surface_reset = true
dash_cooling = false
want_to_dash = false
dash_direction = 1;

safe_x = 0;
safe_y = 0;

//double+ jumps
max_jump = 1; 
current_jump = 0;

//coyote time
coyote_time = 0.05

//dash parameters
dash_time = 0.15;
dash_cooldown = 0.7;
dash_speed = walk_speed * 2.5;
dash_distance = dash_speed * dash_time;
dash_energy = 0;


//jump buffer
jump_buffer = false;
jump_buffer_length = 0.05;
jump_buffer_frames = jump_buffer_length * FRAME_RATE;
jump_buffer_time_source = time_source_create(time_source_game, jump_buffer_frames, time_source_units_frames, _clear_jump_buffer);

function finish_jump() {
	obj_player._jumping = false;
}

_jump_held_length = 0.3;
_jump_held_frames = _jump_held_length * FRAME_RATE;
_jump_held_time_source = time_source_create(time_source_game, _jump_held_frames, time_source_units_frames, finish_jump);


//Attack variables
attack_sequence = noone;
facing_x = 1;
knockback_force_x = 4;
knockback_force_y = 4;
knockback_dir_x = 1;
knockback_dir_y = 0;

iframes = 0;

//Dialogue system
reset_dialogue_defaults();
myPortrait			= spr_portrait_player;
myVoice				= snd_voice2;
myFont				= fnt_dialogue;
myName				= "Player";

myPortraitTalk		= spr_portrait_examplechar_mouth;
myPortraitTalk_x	= 26;
myPortraitTalk_y	= 44;
myPortraitIdle		= spr_portrait_examplechar_idle;

// Room transition
if (global.target_x != -1) {
	x = global.target_x;
	y = global.target_y;
	direction = global.target_direction;
}