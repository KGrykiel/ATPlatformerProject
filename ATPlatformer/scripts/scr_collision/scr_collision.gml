// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_collision(){
	var _collision = false;
	var _entityList = ds_list_create();
	
	if (horizontal_speed >0) bbox_side = bbox_right; else bbox_side = bbox_left;
	if(tilemap_get_at_pixel(tilemap, bbox_side+horizontal_speed,bbox_top)!=0) || (tilemap_get_at_pixel(tilemap, bbox_side+horizontal_speed, bbox_bottom)!=0)
	{
		if( horizontal_speed>0) x = x - (x mod TILE_SIZE) + (TILE_SIZE-1) -(bbox_right -x);
		else x=x - (x mod TILE_SIZE) - (bbox_left - x);
		horizontal_speed=0;
		_collision = true;
	}  
	
	//horizontal entitities
	var _entitityCount = instance_position_list(x+horizontal_speed, y, obj_parent_entity, _entityList,false);
	var _snapX;
	while(_entitityCount >0)
	{
		var _entityCheck = _entityList[| 0]; 
		if (_entityCheck.entityCollision == true)
		{
			//Move as close as we can
			if(sign(horizontal_speed) ==-1) _snapX=_entityCheck.bbox_right+1;
			else _snapX = _entityCheck.bbox_left-1;
			x=_snapX;
			horizontal_speed = 0;
			_collision = true;
			_entitityCount = 0;
		}
		ds_list_delete(_entityList,0);
		_entitityCount--;
	}
	
	
	//clear list between axis
	ds_list_clear(_entityList)
	
	//vertical collision
	
	if (vertical_speed >0) {
		bbox_side = bbox_bottom 
		if(tilemap_get_at_pixel(tilemap,bbox_left, bbox_side+ceil(vertical_speed))!=0) || (tilemap_get_at_pixel(tilemap,bbox_right, bbox_side+ceil(vertical_speed))!=0)
		{
			if( vertical_speed>0) y = y - (y mod TILE_SIZE) +  (TILE_SIZE-1) -(bbox_bottom -y);
			else y=y - (y mod TILE_SIZE) - (bbox_top - y);
			vertical_speed=0;
			_collision = true;
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
	
	
	//vertical entities //IF CHARACTER VIBRATES WHEN STANDING ON OBJECTS LET ME KNOW @AKAS
	var _entitityCount = instance_position_list(x, y+vertical_speed, obj_parent_entity, _entityList,false);
	var _snapY;
	while(_entitityCount >0)
	{
		var _entityCheck = _entityList[| 0]; 
		if (_entityCheck.entityCollision == true)
		{
			//Move as close as we can
			if(sign(vertical_speed) ==-1) _snapY=_entityCheck.bbox_bottom+1;
			else _snapY = _entityCheck.bbox_top-1;
			y=_snapY;
			vertical_speed = 0;
			_collision = true;
			_entitityCount = 0;
		}
		ds_list_delete(_entityList,0);
		_entitityCount--;
	}
	
	ds_list_destroy(_entityList)
}

function check_for_floor()
{
	if(tilemap_get_at_pixel(tilemap,bbox_left, bbox_bottom+ceil(vertical_speed))!=0) || (tilemap_get_at_pixel(tilemap,bbox_right, bbox_bottom+ceil(vertical_speed))!=0) 
	{
		return true;
	}
	else return false;
}