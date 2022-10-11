// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function grounded_attack() {
	if key_up {
		attack_sequence = layer_sequence_create("Sequences", x, y, seq_attack_up);
		knockback_dir_x = 0;
		knockback_dir_y = -1;
	} else {
		attack_sequence = layer_sequence_create("Sequences", x, y, seq_attack);
		layer_sequence_xscale(attack_sequence, facing_x);
		knockback_dir_x = facing_x;
		knockback_dir_y = 0;
	}
}

function air_attack() {
	if key_up {
		attack_sequence = layer_sequence_create("Sequences", x, y, seq_attack_up);
		knockback_dir_x = 0;
		knockback_dir_y = -1;
	} else if key_down {
		attack_sequence = layer_sequence_create("Sequences", x, y, seq_attack_down);
		knockback_dir_x = 0;
		knockback_dir_y = 1;
	} else {
		attack_sequence = layer_sequence_create("Sequences", x, y, seq_attack);
		layer_sequence_xscale(attack_sequence, facing_x);
		knockback_dir_x = facing_x;
		knockback_dir_y = 0;
	}
}

function draw_attack() 
{
	if attack_sequence != noone
	{
		layer_sequence_x(attack_sequence, x);
		layer_sequence_y(attack_sequence, y);
	}
	
}

function attack_knockback() {
	horizontal_speed += -knockback_dir_x * knockback_force;
	vertical_speed += -knockback_dir_y * knockback_force;
}