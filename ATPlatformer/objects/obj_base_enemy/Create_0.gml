/// @description Insert description here
// You can write your code in this editor

event_inherited();
environmental_horizontal_speed = 0;
environmental_vertical_speed = 0;
grav = 0.5;
horizontal_knockback = 10;
vertical_knockback = 5;

function idle_state() {}

state = idle_state;


// Health

scr_create_health_vars(max_health);
