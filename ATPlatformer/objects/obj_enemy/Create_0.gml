 /// @description Insert description here
// You can write your code in this editor
event_inherited()

invulenerable = false

function walk_state() {
	if (horizontal_speed == 0) horizontal_speed = 1;

	// handle destroying the enemy when coming into contact with player attacks
	if (place_meeting(x, y, obj_player_attack)) {
		if !invulenerable {
			scr_damage(5);
			obj_player.attack_knockback();
			invulenerable = true;
			alarm[0] = floor(0.4*game_get_speed(gamespeed_fps))
		}
	}

	// change direction when colliding with a wall
	if check_collision(horizontal_speed, -1) {
		horizontal_speed *= -1;
	}

	// Change direction when colliding with another enemy
	if place_meeting(x,y,obj_enemy) {
		horizontal_speed *= -1;
	}

	// damage player when colliding
	if place_meeting(x, y, obj_player) {
		with (obj_player) {
			if iframes <= 0 {
				scr_damage(2);
				horizontal_speed = sign(x - other.x) * other.horizontal_knockback
				vertical_speed = -other.vertical_knockback
				iframes = 60;
				}
		}
	}

	vertical_speed += grav;
	vertical_speed = min(vertical_speed, 5)
}

state = walk_state;






