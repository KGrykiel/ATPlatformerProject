/// @desc Returns the direction from the origin to (_x, _y) in degrees clockwise from right
function scr_vector_to_direction(_x, _y){
	if _x > 0 {
		return radtodeg(arctan(_y/_x));
	}
	if _x < 0 {
	return radtodeg(arctan(_y/_x)) - 180;
	}
	if _x == 0 {
		if _y > 0 {
			return 90;
		}
		if _y < 0 {
			return -90;
		}
		// If _x and _y are 0, returns 0
		if _y == 0 {
			return 0;
		}
	}
}