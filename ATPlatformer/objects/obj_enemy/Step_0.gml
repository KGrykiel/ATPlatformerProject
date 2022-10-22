/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x, y, obj_player_attack)) {
	instance_destroy();
	obj_player.attack_knockback();
}

if place_meeting(x+horizontal_speed, y, obj_parent_entity) {
	horizontal_speed *= -1;
}

if place_meeting(x, y, obj_player) {
	with (obj_player) {
		if iframes <= 0 {
			horizontal_speed = sign(x - other.x) * other.horizontal_knockback
			vertical_speed = -other.vertical_knockback
			iframes = 60;
			}
	}
}

vertical_speed += grav;
vertical_speed = min(vertical_speed, 5)

scr_collision()

x += horizontal_speed;
y += vertical_speed;












