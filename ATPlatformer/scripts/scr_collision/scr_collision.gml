// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_collision_old(){
	
	var _collision = false;
	var _entity_list = ds_list_create();
	
	grounded = false
	
	if (horizontal_speed >0) {bbox_side = bbox_right;} else {bbox_side = bbox_left;	}
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
	var _left_top = tilemap_get_at_pixel(obj_manager.collision_tilemap, bbox_left + (_move_x), bbox_top + (_move_y));

	// This checks for tile collision at the top-right corner of the instance's mask
	var _right_top = tilemap_get_at_pixel(obj_manager.collision_tilemap, bbox_right + (_move_x), bbox_top + (_move_y));

	// This checks for tile collision at the bottom-right corner of the instance's mask
	var _right_bottom = tilemap_get_at_pixel(obj_manager.collision_tilemap, bbox_right + (_move_x), bbox_bottom + (_move_y));

	// This checks for tile collision at the bottom-left corner of the instance's mask
	var _left_bottom = tilemap_get_at_pixel(obj_manager.collision_tilemap, bbox_left + (_move_x), bbox_bottom + (_move_y));

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
	//horizontal collision
	if(check_collision(horizontal_speed, 0))
	{
		while(abs(horizontal_speed) > 0.1)
		{
			horizontal_speed *= 0.5;
			if (!check_collision(horizontal_speed,0)) x += horizontal_speed
		}
		horizontal_speed = 0;
	}
	
	//vertical collision
	if(check_collision(0, vertical_speed))
	{
		while(abs(vertical_speed) >0.1)
		{
			vertical_speed *= 0.5;
			if(!check_collision(0, vertical_speed)) y += vertical_speed;
		}
		vertical_speed = 0;
	}
	
	//bug fix to avoid getting stuck on corners
	if(check_collision(horizontal_speed, vertical_speed))
	{
		horizontal_speed = 0;
	}
}

function scr_environmental_collision()
{
	//horizontal collision
	if(check_collision(environmental_horizontal_speed, 0))
	{
		while(abs(environmental_horizontal_speed) > 0.1)
		{
			environmental_horizontal_speed *= 0.5;
			if (!check_collision(environmental_horizontal_speed,0)) x += environmental_horizontal_speed
		}
		environmental_horizontal_speed = 0;
	}
	
	//vertical collision
	if(check_collision(0, environmental_vertical_speed))
	{
		while(abs(environmental_vertical_speed) >0.1)
		{
			environmental_vertical_speed *= 0.5;
			if(!check_collision(0, environmental_vertical_speed)) y += environmental_vertical_speed;
		}
		environmental_vertical_speed = 0;
	}
	
	//bug fix to avoid getting stuck on corners
	if(check_collision(environmental_horizontal_speed, environmental_vertical_speed))
	{
		environmental_horizontal_speed = 0;
	}
}

function check_for_wall_old() {
	if (wall_jump_enabled) {
		if (facing_x == 1) {bbox_side = bbox_right;} else if (facing_x == -1) { bbox_side = bbox_left; }
	
		if (tilemap_get_at_pixel(tilemap, bbox_side + facing_x,bbox_top) != 0) || 
		(tilemap_get_at_pixel(tilemap, bbox_side + facing_x, bbox_bottom) != 0)
		{
			//show_debug_message("against wall!")
			against_wall = true
		}
		else {
			//show_debug_message("not")
			against_wall = false
		}
	}
}

// essentially just checks if there's a wall one pixel to the left or to the right of the player;
// independent of movement speed so works even if player is stationary
function check_for_wall() {
	if (wall_jump_enabled) {
		if (check_collision(1,0) || check_collision(-1,0)) {
			against_wall = true
		}
		else {
			against_wall = false
		}
	}
}
