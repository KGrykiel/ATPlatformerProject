 /// @description Insert description here
// You can write your code in this editor
event_inherited()


walk_state = function() {
	move_forward_substate(1);
	get_hit_substate();
	bounce_on_wall_substate();
	bounce_on_enemy_substate();
	damage_player_substate();
	fall_substate(5);
	
	// Key press check is temporary
	if keyboard_check_pressed(ord("P")) {
		state = charge_state;
	}
}


charge_state = function() {
	move_forward_substate(2);
	get_hit_substate();
	bounce_on_wall_substate();
	bounce_on_enemy_substate();
	damage_player_substate();
	fall_substate(5);
}


alarm_state = function() {
	move_forward_substate(2);
	damage_player_substate();
	fall_substate(5);
}
	

horizontal_speed = 0;
state = walk_state;