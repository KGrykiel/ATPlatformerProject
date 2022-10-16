/// @description Allows platform to move and checks for nearby player

// If the player is on the platform, moves the player at the same speed as the platform
event_inherited()

	if(place_meeting(x,y+vy,obj_player))
	{
		obj_player.x += (current_direction * (vx));
		obj_player.y += (current_direction * (vy));
	}

if is_player_on {
	obj_player.x += (current_direction * (vx));
	obj_player.y += (current_direction * (vy));
}

// Moves the platform
x += (current_direction * vx);
y += (current_direction * vy);