/// @description Allows platform to move and checks for nearby player

// If the player is on the platform, moves the player at the same speed as the platform
isNearbyPlayer = place_meeting(x,y-10,obj_player);

if isNearbyPlayer {
	obj_player.x += (currentDirection * (vx)) / room_speed;
	obj_player.y += (currentDirection * (vy)) / room_speed;
}


// Moves the platform
x += (currentDirection * vx) / room_speed;
y += (currentDirection * vy) / room_speed;
