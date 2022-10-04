/// @description Turn around

// Resets alarm
alarm[0] = room_speed * timeToTravel;


// Resets position to where it should be to correct for rounding errors
if currentDirection == 1 {
	x = xend;
	y = yend;
}
else {
	x = xstart;
	y = ystart;
}

// Swaps direction of travel
currentDirection *= -1;