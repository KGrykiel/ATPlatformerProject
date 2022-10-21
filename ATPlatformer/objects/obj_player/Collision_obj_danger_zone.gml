script_execute(scr_damage_player);

if (other.use_reset)
{
	x = other.reset_x;
	y = other.reset_y;
} else {
	x = safe_x;
	y = safe_y;
}

horizontal_speed = 0;
vertical_speed = 0;

state = player_state_stun;
alarm[0] = -1; // Prevent state being switched out of stun

var _reenable_input = function () {
	state = player_state_free;
}

var _ts = time_source_create(time_source_game, 1, time_source_units_seconds, _reenable_input);
time_source_start(_ts);