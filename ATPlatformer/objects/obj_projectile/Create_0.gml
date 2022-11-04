/// @description Defining variables

if not variable_instance_exists(id, "initial_direction") {
	initial_direction = 0;
}
if not variable_instance_exists(id, "initial_speed") {
	initial_speed = 5;
}
if not variable_instance_exists(id, "immune_characters") {
	immune_characters = []
}


// Calculates initial horizontal and vertical speed
horizontal_speed = initial_speed * cos(degtorad(initial_direction));
vertical_speed = (initial_speed * sin(degtorad(initial_direction)));