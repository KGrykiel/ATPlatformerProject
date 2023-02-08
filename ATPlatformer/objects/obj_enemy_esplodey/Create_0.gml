 /// @description Insert description here
// You can write your code in this editor
event_inherited()
ParticleSystem = part_system_create();

esplode_particle = part_type_create();
part_type_shape(esplode_particle, pt_shape_disk);
part_type_scale(esplode_particle,1,1)
part_type_size(esplode_particle,0.10,0.15,-.001,0)
part_type_color2(esplode_particle,$fcdb05,$db3c02);
part_type_alpha2(esplode_particle,1,0);
part_type_speed(esplode_particle,0.1,0.5,0,0);
part_type_direction(esplode_particle,0,359,0,0);
part_type_gravity(esplode_particle,0.02,90);
// part_type_orientation(first_particle,0,359,10,0,true); useless cos disk but here for reference
part_type_life(esplode_particle,100,150);
part_type_blend(esplode_particle,true);

emitter = part_emitter_create(ParticleSystem)
part_emitter_region(ParticleSystem, emitter, x-20, x+20, y-20, y+20, ps_shape_ellipse, ps_distr_gaussian);

function walk_state() {
	if (horizontal_speed == 0) horizontal_speed = 1;

	// handle destroying the enemy when coming into contact with player attacks
	if (place_meeting(x, y, obj_player_attack)) {
		part_emitter_stream(ParticleSystem, emitter, esplode_particle, 1);
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






