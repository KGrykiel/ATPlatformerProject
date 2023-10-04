 /// @description Insert description here
// You can write your code in this editor
event_inherited()


// TODO: get rid of this duplication
collide_with_attacks = function() {
	var attack_instance = instance_place(x, y, obj_player_attack)
	if (!attack_instance || is_invincible()) return;
	apply_damage(1);
	horizontal_speed += sign(x - obj_player.x) * 4;
	if (obj_player.bbox_bottom > bbox_top) vertical_speed -= 4;
	obj_player.attack_recoil();
	iframes = floor(0.4*game_get_speed(gamespeed_fps))
}

deal_contact_damage = function() {
	var player = instance_place(x, y, obj_player)
	if (!player || player.is_invincible()) return;
	with (player) {
		apply_damage(2);
		horizontal_speed += sign(x - other.x) * other.horizontal_knockback;
		vertical_speed += other.vertical_knockback;
		iframes = 60;
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

walk_state = function() {
	collide_with_attacks();
	turnaround_on_collision();
	deal_contact_damage();

	vertical_speed += grav;
	vertical_speed = min(vertical_speed, 10)
	if abs(horizontal_speed) > 1 {
		horizontal_speed -= sign(horizontal_speed) * 0.1;
	} else if (horizontal_speed) < 1 {
		horizontal_speed = sign(horizontal_speed);
	}
}

state = walk_state;
horizontal_speed = 1;





