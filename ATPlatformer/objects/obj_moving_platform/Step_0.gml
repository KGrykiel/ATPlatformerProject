/// @description Allows platform to move and checks for nearby player

// If the player is on the platform, moves the player at the same speed as the platform
event_inherited()

if isPlayerOn {
	obj_player.x += (currentDirection * (vx)) / FRAME_RATE;
	obj_player.y += (currentDirection * (vy)) / FRAME_RATE;
}


// Moves the platform
x += (currentDirection * vx) / FRAME_RATE;
y += (currentDirection * vy) / FRAME_RATE;
