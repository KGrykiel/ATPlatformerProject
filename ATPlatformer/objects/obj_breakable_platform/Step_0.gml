/// @description Insert description here
// You can write your code in this editor

event_inherited()

if isPlayerOn {
	if alarm[0] == -1 {
		alarm[0] = break_time * FRAME_RATE;
	}
}
else if reset_when_no_collision {
	alarm[0] = -1;
}

