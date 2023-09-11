 /// @description Insert description here
// You can write your code in this editor
event_inherited()

function walk_state() {
	if (horizontal_speed == 0) horizontal_speed = 1;

	// handle destroying the enemy when coming into contact with player attacks
	if (place_meeting(x, y, obj_player_attack)) {
		instance_destroy(self)
		obj_player.attack_knockback();
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
				current_health -= 2;
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






