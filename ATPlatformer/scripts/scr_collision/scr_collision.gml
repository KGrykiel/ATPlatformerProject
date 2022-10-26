// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_collision_old(){
	
	var _collision = false;
	var _entity_list = ds_list_create();
	grounded = false
	
	if (horizontal_speed >0) bbox_side = bbox_right; else bbox_side = bbox_left;
	if(tilemap_get_at_pixel(tilemap, bbox_side+ceil(horizontal_speed),bbox_top)!=0) || (tilemap_get_at_pixel(tilemap, bbox_side+ceil(horizontal_speed), bbox_bottom)!=0)
	{
		if( horizontal_speed>0) x = x - (x mod TILE_SIZE) + (TILE_SIZE-1) -(bbox_right -x);
		else x=x - (x mod TILE_SIZE) - (bbox_left - x);
		horizontal_speed=0;
		_collision = true;
	}  

	if(place_meeting(x+horizontal_speed,y,obj_parent_entity))
	{
		while(abs(horizontal_speed) > 0.1)
		{
			horizontal_speed *= 0.5;
			if (!place_meeting(x+ horizontal_speed, y, obj_parent_entity)) x += horizontal_speed
		}
		horizontal_speed = 0;
		_collision = true;
	}
	
	
	//clear list between axis
	ds_list_clear(_entity_list)
	
	//vertical collision
	
	if (vertical_speed > 0) {
		bbox_side = bbox_bottom
		if(tilemap_get_at_pixel(tilemap,bbox_left, bbox_side+ceil(vertical_speed))!=0) || (tilemap_get_at_pixel(tilemap,bbox_right, bbox_side+ceil(vertical_speed))!=0)
		{
			if(vertical_speed>=0) y = y - (y mod TILE_SIZE) +  (TILE_SIZE - 1) -(bbox_bottom -y);
			else y= y - (y mod TILE_SIZE) - (bbox_top - y);
			vertical_speed=0;
			_collision = true;
			grounded = true; // we don't need to check that we are moving downwards since the if statement we are in has already checked
		}
	}
	else {
		bbox_side = bbox_top;
		if(tilemap_get_at_pixel(tilemap,bbox_left, bbox_side+floor(vertical_speed))!=0) || (tilemap_get_at_pixel(tilemap,bbox_right, bbox_side+floor(vertical_speed))!=0)
		{
			if( vertical_speed>0) y = y - (y mod TILE_SIZE) +  (TILE_SIZE-1) -(bbox_bottom -y); //duplicated code, don't care lol
			else y=y - (y mod TILE_SIZE) - (bbox_top - y);
			vertical_speed=0;
			_collision = true;
		}
	}
	
	if(place_meeting(x,y+vertical_speed,obj_parent_entity))
	{
		while(abs(vertical_speed) > 0.1)
		{
			vertical_speed *= 0.5;
			if(!place_meeting(x,y+vertical_speed,obj_parent_entity)) y+=vertical_speed;
		}
		if(vertical_speed >= 0) grounded = true;
		vertical_speed = 0;
		_collision = true;		
	}
	
	
}

function check_collision(_move_x, _move_y) 
{
	// This checks for an object collision at the new position, where the instance is going to move
	// We get the new position by adding _move_x and _move_y to the instance's X and Y values
	if (place_meeting(x + _move_x, y + _move_y, obj_parent_entity))
	{
		// If there was an object collision, return true, and end the function
		return true;
	}

	// The function continues if there were no object collisions. In this case we check for tile
	// collisions, at each corner of the instance's bounding box.
	// This checks for tile collision at the top-left corner of the instance's mask
	var _left_top = tilemap_get_at_pixel(obj_manager.collision_tilemap, bbox_left + floor(_move_x), bbox_top + floor(_move_y));

	// This checks for tile collision at the top-right corner of the instance's mask
	var _right_top = tilemap_get_at_pixel(obj_manager.collision_tilemap, bbox_right + ceil(_move_x), bbox_top + floor(_move_y));

	// This checks for tile collision at the bottom-right corner of the instance's mask
	var _right_bottom = tilemap_get_at_pixel(obj_manager.collision_tilemap, bbox_right + ceil(_move_x), bbox_bottom + ceil(_move_y));

	// This checks for tile collision at the bottom-left corner of the instance's mask
	var _left_bottom = tilemap_get_at_pixel(obj_manager.collision_tilemap, bbox_left + floor(_move_x), bbox_bottom + ceil(_move_y));

	// The results of the above four actions were stored in temporary variables. If any of those variables were true, meaning a tile
	// collision was found at any given corner, we return true and end the function.
	if (_left_top or _right_top or _right_bottom or _left_bottom)
	{
		return true;
	}

	// If no tile collisions were found, the function continues.
	// In that case we return false, to indicate that no collisions were found, and the instance is free to move to the new position.
	return false;
}

function scr_collision()
{
	
	if(check_collision(horizontal_speed, 0))
	{
		while(abs(horizontal_speed) > 0.1)
		{
			horizontal_speed *= 0.5;
			if (!check_collision(horizontal_speed,0)) x += horizontal_speed
		}
		horizontal_speed = 0;
	}
	
	if(check_collision(0, vertical_speed))
	{
		while(abs(vertical_speed) > 0.1)
		{
			vertical_speed *= 0.5;
			if(!check_collision(0, vertical_speed)) y += vertical_speed;
		}
		vertical_speed = 0;
		
	}
	/*
	// The section below handles pixel-perfect collision checking.
	// It does collision checking twice, first on the X axis, and then on the Y axis.
	// On each axis, it moves the character pixel-by-pixel until its velocity for that axis is covered, or a collision is found.
	// 'move_count' is how many total pixels the character needs to move this frame. It is the absolute value of the velocity on an axis.
	// 'move_once' is the amount of pixels it needs to move once, before checking for a collision. It is 1, 0, or -1.
	var _move_count = abs(horizontal_speed);
	var _move_once = sign(horizontal_speed);

	// This runs a loop, which runs 'move_count' times. All code in this block is repeated that many amount of times.
	while (_move_count > 0)
	{
		// This calls the check_collision function to check for collisions on the X axis, if moved by the move_once value on that dimension.
		// The Y argument is set to 0, so for this collision there is no Y movement.
		// The result of the function, either true or false, is stored in the 'collision_found' variable, which is temporary.
		var _collision_found = check_collision(_move_once, 0);

		// This checks if collision_found is false, meaning a collision was not found, and the player is free to move once on the X axis.
		if (!_collision_found)
		{
			// In that case, move_once is added to the X coordinate of the character.
			x += _move_once;
		}
		// This 'else' block runs if a collision was found.
		else
		{
			// In that case, we reset the X velocity to 0, so the character stops its movement on that axis.
			horizontal_speed = 0;
	
			// Then we break out of the Repeat loop, as no more collision checks are required.
			break;
		}
		_move_count--;
	}

	// We now repeat all of the previous steps to check for collisions on the Y axis.
	// Everything is the same, but vel_x is replaced by vel_y, and the check_collision function takes a Y value (its second argument).
	var _move_count = abs(vertical_speed);
	var _move_once = sign(vertical_speed);

	// This runs a loop, which runs 'move_count' times. All actions attached to this are repeated that many amount of times.
	while (_move_count > 0)
	{
		// This calls the check_collision function to check for collisions on the Y axis, if moved by the move_once value.
		// The result of the function, either true or false, is stored in the 'collision_found' variable, which is temporary.
		var _collision_found = check_collision(0, _move_once);

		// This checks if collision_found is false, meaning a collision was not found, and the player is free to move once on the Y axis.
		if (!_collision_found)
		{
			// In that case, move_once is added to the Y coordinate of the character.
			y += _move_once;
		}
		// This 'else' block runs if a collision was found.
		else
		{
			// In that case, we reset the Y velocity to 0, so the character stops its movement on that axis.
			vertical_speed = 0;
	
			// Then we break out of the Repeat loop, as no more collision checks are required.
			break;
		}
		_move_count--;
	}*/
}
