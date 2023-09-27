 /// @description Insert description here
// You can write your code in this editor
event_inherited()

charge_state = function() {
	move_forward_substate(2);
	get_hit_substate(1);
	bounce_on_wall_substate();
	bounce_on_enemy_substate();
	damage_player_substate(1);
	fall_substate(5);
}

horizontal_speed = 0;
state = charge_state;
