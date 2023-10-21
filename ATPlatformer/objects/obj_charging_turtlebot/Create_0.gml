 /// @description Insert description here
// You can write your code in this editor
event_inherited()

// The direction the turtlebot will start charging (towards the player) (>0 for right, <0 for left)
charge_direction = 1;
// Number of seconds the turtlebot will stay in the alarm state after seeing the player
alarm_time = 1
// Distance at which the turtlebot will charge the player (if it can see the player)
charge_range = 175
// Speed at which the turtlebot charges
charge_speed = 8

walk_state = function() {
	move_forward_substate(1);
	get_hit_substate();
	bounce_on_wall_substate();
	bounce_on_enemy_substate();
	damage_player_substate();
	fall_substate(5);
	
	if is_player_detected_substate() {
		// Sets the move direction so the turtlebot will charge towards the player
		charge_direction = obj_player.x - x;
		if charge_direction == 0 {
			charge_direction = 1;
		}
	
		// Sets the alarm which will change from the alarm_state to the charge_state
		alarm[1] = floor(alarm_time * game_get_speed(gamespeed_fps));
		
		sprite_index = spr_charging_turtlebot_triggered

		
		state = alarm_state;
	}
}

idle_state = function() {
	get_hit_substate();
	damage_player_substate();
	if is_player_detected_substate() {
		// Sets the move direction so the turtlebot will charge towards the player
		charge_direction = obj_player.x - x;
		if charge_direction == 0 {
			charge_direction = 1;
		}
	
		// Sets the alarm which will change from the alarm_state to the charge_state
		alarm[1] = floor(alarm_time * game_get_speed(gamespeed_fps));
		
		sprite_index = spr_charging_turtlebot_triggered

		
		state = alarm_state;
	}
	
	fall_substate(5);
}

charge_state = function() {
	move_forward_substate(charge_speed, charge_direction);
	get_hit_substate();
	
	if check_collision(horizontal_speed, -1) {
		//insert some knockback or animation like hitting head first into a wall
		sprite_index = spr_charging_turtlebot_move
		state = walk_state;
	}
	
	function bounce_on_enemy_substate() {
		if place_meeting(x,y,obj_base_enemy) {
			//damage the other enemy?
			sprite_index = spr_charging_turtlebot_move
			state = walk_state;
		}
	}

	damage_player_substate(2);
	fall_substate(5);
}


alarm_state = function() {
	move_forward_substate(0);
	get_hit_substate();
	damage_player_substate();
	fall_substate(5);
}
	
	
is_player_detected_substate = function() {
	show_debug_message(collision_line(x, y, obj_player.x, obj_player.y, [layer_tilemap_get_id("Collisions"), obj_parent_entity], false, true) == noone)
	if (distance_to_object(obj_player) < charge_range) {
		if collision_line(x, y, obj_player.x, obj_player.y, [obj_parent_entity, layer_tilemap_get_id("Collisions")], false, true) == noone {
			return true;
		}
	}
	else return false;
}


horizontal_speed = 0;
state = walk_state;