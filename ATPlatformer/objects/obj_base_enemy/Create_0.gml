/// @description Insert description here
// You can write your code in this editor

event_inherited();
environmental_horizontal_speed = 0;
environmental_vertical_speed = 0; 
grav = 0.5;
horizontal_knockback = 10;
vertical_knockback = 5;
invulenerable = false;

default_damage = 1;
default_max_fall_speed = 5;

#region States

function idle_state() {}

function walk_state() {
	move_forward_substate();
	get_hit_substate(1);
	bounce_on_wall_substate();
	bounce_on_enemy_substate();
	damage_player_substate(1);
	fall_substate(5);
}

function dead_state() {
	instance_destroy();
}

#endregion
 
 
#region Substates (small functions which can be used in many states)

/// @description Substate to handle destroying the enemy when coming into contact with player attacks (use when creating states)
/// @param {real} _damage How much damage is taken when hit (default=player melee_damage)
function get_hit_substate(_damage=obj_player.melee_damage) {
	if (place_meeting(x, y, obj_player_attack)) {
		if !invulenerable {
			scr_damage(_damage);
			obj_player.attack_knockback();
			invulenerable = true;
			alarm[0] = floor(0.4*game_get_speed(gamespeed_fps))
		}
	}
}


/// @description Substate to change direction when colliding with a wall
function bounce_on_wall_substate() {
	if check_collision(horizontal_speed, -1) {
		horizontal_speed *= -1;
	}
}

/// @description Substate to change direction when colliding with another enemy
function bounce_on_enemy_substate() {
	if place_meeting(x,y,obj_base_enemy) {
		horizontal_speed *= -1;
	}
}

/// @description Substate to damage player when colliding
/// @param {real} _damage How much to damage the player (default=1)
function damage_player_substate(_damage=default_damage) {
	if place_meeting(x, y, obj_player) {
		with (obj_player) {
			if iframes <= 0 {
				scr_damage(_damage);
				horizontal_speed = sign(x - other.x) * other.horizontal_knockback
				vertical_speed = -other.vertical_knockback
				iframes = 60;
				}
		}
	}
}


/// @description Substate to allow enemy to fall
/// @param {real} _max_speed Maximum speed enemy will fall (default=5)
function fall_substate(_max_speed=default_max_fall_speed) {
	vertical_speed += grav;
	vertical_speed = min(vertical_speed, _max_speed)
}

/// @description Substate to move enemy forward
/// @param {real} _speed Speed at which enemy moves
function move_forward_substate(_speed=1) {
	if (horizontal_speed == 0) horizontal_speed = _speed;
}

#endregion


state = idle_state

scr_create_health_vars(10,10)

