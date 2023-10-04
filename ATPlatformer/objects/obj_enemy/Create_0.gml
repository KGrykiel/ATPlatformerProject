 /// @description Insert description here
// You can write your code in this editor
event_inherited()

collide_with_attacks = function() {
	if (place_meeting(x, y, obj_player_attack)) {
		if !is_invincible() {
			apply_damage(1);
			apply_impulse(sign(x - obj_player.x) * 4, -4);
			obj_player.attack_recoil();
			iframes = floor(0.4*game_get_speed(gamespeed_fps))
		}
	}	
}

turnaround_on_collision = function() {
	if check_collision(horizontal_speed, -1) {
		horizontal_speed *= -1;
	}
	
	if place_meeting(x,y,obj_enemy) {
		horizontal_speed *= -1;
	}
}

deal_contact_damage = function() {
	var player = instance_place(x, y, obj_player)
	if (!player) return;
	with (player) {
		if (is_invincible()) return;
		apply_damage(2);
		apply_impulse(
			sign(x - other.x) * other.horizontal_knockback,
			-other.vertical_knockback
		);
		iframes = 60;
	}
	
}

walk_state = function() {
	collide_with_attacks();
	turnaround_on_collision();
	deal_contact_damage();

	vertical_speed += grav;
	vertical_speed = min(vertical_speed, 5)
	if abs(horizontal_speed > 1) {
		horizontal_speed -= sign(horizontal_speed) * 0.25;
	} else {
		horizontal_speed = sign(horizontal_speed);
	}
}

state = walk_state;
horizontal_speed = 1;





