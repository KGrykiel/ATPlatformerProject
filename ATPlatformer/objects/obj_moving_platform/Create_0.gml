/// @description Variable definitions

// x and y coordinates when platform turns around
xend = xstart + xDisplacement;
yend = ystart + yDisplacement;

// Distance between when it changes direction
distanceToTravel = power(power((xend - xstart),2) + power((yend - ystart),2), 0.5);

// Time between when it changes direction
timeToTravel = distanceToTravel / platformSpeed;


// Sets x and y velocity (depending on platformSpeed)
if distanceToTravel != 0 {
	vx = ((xend-xstart) / distanceToTravel) * platformSpeed;
	vy = ((yend-ystart) / distanceToTravel) * platformSpeed;
}
else {
	vx = 0;
	vy = 0;
}

if timeToTravel != 0 {
	// Sets an alarm to change direction
	alarm[0] = FRAME_RATE * timeToTravel;
}

// 1 = positive direction, -1 = negative direction
currentDirection = 1;