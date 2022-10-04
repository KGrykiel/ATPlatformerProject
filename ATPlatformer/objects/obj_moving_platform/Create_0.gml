/// @description Variable definitions

// x and y coords when platform turns around
xend = xstart + xDisplacement;
yend = ystart + yDisplacement;

// Distance between when it changes direction
distanceToTravel = power(power((xend - xstart),2) + power((yend - ystart),2), 0.5);
show_debug_message("Dist: " + string(distanceToTravel))

// Time between when it changes direction
timeToTravel = distanceToTravel / platformSpeed;


// Sets x and y velocity (depending on platformSpeed)
vx = ((xend-xstart) / distanceToTravel) * platformSpeed;
vy = ((yend-ystart) / distanceToTravel) * platformSpeed;

// Sets an alarm to change direction
alarm[0] = room_speed * timeToTravel;

// 1 = positive direction, -1 = negative direction
currentDirection = 1;