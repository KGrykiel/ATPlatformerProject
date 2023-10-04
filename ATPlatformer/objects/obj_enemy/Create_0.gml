 /// @description Insert description here
// You can write your code in this editor
event_inherited()

check_damage = function() {
	if (place_meeting(x, y, obj_player_attack)) {
		if !is_invincible() {
			apply_damage(1);
			obj_player.attack_knockback();
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
		if (iframes <= 0) {
			apply_damage(2);
			horizontal_speed = sign(x - other.x) * other.horizontal_knockback
			vertical_speed = -other.vertical_knockback
			iframes = 60;
		}
	}
	
}

walk_state = function() {
	//if (horizontal_speed == 0) horizontal_speed = 1;
	check_damage();
	turnaround_on_collision();
	deal_contact_damage();

	vertical_speed += grav;
	vertical_speed = min(vertical_speed, 5)
}

state = walk_state;
horizontal_speed = 1;





