// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_collision(){
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

function check_for_floor()
{
	if(tilemap_get_at_pixel(tilemap,bbox_left, bbox_bottom+ceil(vertical_speed))!=0) || (tilemap_get_at_pixel(tilemap,bbox_right, bbox_bottom+ceil(vertical_speed))!=0) 
	{
		return true;
	}
	else return false;
}