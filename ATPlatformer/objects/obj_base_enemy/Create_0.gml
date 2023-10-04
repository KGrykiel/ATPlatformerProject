/// @description Insert description here
// You can write your code in this editor

event_inherited();
grav = 0.5;
horizontal_knockback = 10;
vertical_knockback = 5;

function idle_state() {}

function dead_state() {
	instance_destroy();
}

state = idle_state

