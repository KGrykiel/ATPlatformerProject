/// @description Insert description here

 with (obj_player) state = player_state_transition;

if (leading == OUT) {
	percent = min(1, percent + TRANSITION_SPEED);
	if (percent >= 1) {
		room_goto(target);
		leading = IN;
	}
}
else {
	percent = max(0, percent - TRANSITION_SPEED);
	if (percent <= 0) {
		with (obj_player) state = player_state_free;
		instance_destroy();
	}
}


