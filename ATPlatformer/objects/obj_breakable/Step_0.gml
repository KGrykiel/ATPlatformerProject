/// @description Insert description here
// You can write your code in this editor

if place_meeting(x, y, obj_player_attack) {
	with(obj_player) {attack_knockback()}
	if (!indestructible) instance_destroy();
}