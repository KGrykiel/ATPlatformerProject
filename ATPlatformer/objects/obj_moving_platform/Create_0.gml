/// @description Variable definitions

// x and y coordinates when platform turns around
xend = xstart + x_displacement;
yend = ystart + y_displacement;

// Distance between when it changes direction
distance_to_travel = power(power((xend - xstart),2) + power((yend - ystart),2), 0.5);

// Time between when it changes direction
time_to_travel = distance_to_travel / platform_speed;


// Sets x and y velocity ( depending on platformSpeed)
if distance_to_travel != 0 {
	vx = ((xend-xstart) / distance_to_travel) * platform_speed;
	vy = ((yend-ystart) / distance_to_travel) * platform_speed;
}
else {
	vx = 0;
	vy = 0;
}

if time_to_travel != 0 {
	// Sets an alarm to change direction
	alarm[0] = time_to_travel;
}

// 1 = positive direction, -1 = negative direction
current_direction = 1;
