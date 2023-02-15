 /// @description Insert description here
// You can write your code in this editor
event_inherited()
emitter = part_emitter_create(particle_system)

function walk_state() {
	if (horizontal_speed == 0) horizontal_speed = 1;

	// handle destroying the enemy when coming into contact with player attacks
	if (place_meeting(x, y, obj_player_attack)) {
		var centerX = x - sprite_get_xoffset(sprite_index) + sprite_width / 2;
		var centerY = y - sprite_get_yoffset(sprite_index) + sprite_height / 2;
		part_emitter_region(particle_system, emitter, centerX-20, centerX+20, centerY-20, centerY+20, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_burst(particle_system, emitter, default_particle, 150);
		instance_destroy();
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






