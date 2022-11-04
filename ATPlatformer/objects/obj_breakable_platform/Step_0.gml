/// @description Insert description here
// You can write your code in this editor

event_inherited()

if ds_list_size(list_entities_on) > 0 {
	if alarm[0] == -1 {
		alarm[0] = break_time * FRAME_RATE;
	}
}
else if reset_when_no_collision {
	alarm[0] = -1;
}

