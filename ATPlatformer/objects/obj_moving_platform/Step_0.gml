/// @description Allows platform to move and checks for nearby player

// If the player is on the platform, moves the player at the same speed as the platform
event_inherited()

	if(place_meeting(x,y+vy,obj_player))
	{
		obj_player.x += (currentDirection * (vx));
		obj_player.y += (currentDirection * (vy));
	}

if isPlayerOn {
	obj_player.x += (currentDirection * (vx));
	obj_player.y += (currentDirection * (vy));
}

// Moves the platform
x += (currentDirection * vx);
y += (currentDirection * vy);