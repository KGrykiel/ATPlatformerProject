/// @description Checks to see if an entity is pushing down on the pressure plate

event_inherited();

entity_on = ds_list_size(list_entities_on) >= 1;

if (entity_on && !platform_active) {
	show_debug_message("platform landed on");
	platform_active = true;
	alarm_set(0, 1 + FRAME_RATE * start_delay);
	alarm_set(1, -1);
}

else if (!entity_on && platform_active) {
	show_debug_message("platform exited");
	platform_active = false;
	
	if (alarm_get(0) == -1) {
		alarm_set(1, 1 + FRAME_RATE * end_delay);
	}
	else {
		alarm_set(1, 1 +alarm_get(0) + FRAME_RATE * end_delay);
	}
}