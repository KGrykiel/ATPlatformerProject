/// @description Turn around

// Resets alarm
alarm[0] = time_to_travel;


// Resets position to where it should be to correct for rounding errors
if current_direction == 1 {
	x = xend;
	y = yend;
}
else {
	x = xstart;
	y = ystart;
}

// Swaps direction of travel
current_direction *= -1;