 /// @description Checks for nearby player

event_inherited()

for (var _i = 0; _i < ds_list_size(list_entities_on); _i++){
	var _entity = ds_list_find_value(list_entities_on, _i)
	_entity.environmental_horizontal_speed = vx
	_entity.environmental_vertical_speed = vy
}

//this avoids fucking up the correction mechanism on edge points of the path
if (path_position == 0 || path_position == 1){
	vx *= -1
	vy *= -1
}
var _collision = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_character, false, true)
var _new_collision = collision_rectangle(bbox_left+vx, bbox_top+vy, bbox_right+vx, bbox_bottom+vy, obj_character, false, true)
if(_new_collision != noone){
	var _correction_x = 0;
	var _correction_y = 0;
	if(_collision != noone){
		if(vx>0) _correction_x = self.bbox_right  - _collision.bbox_left
		if(vx<0) _correction_x = self.bbox_left   - _collision.bbox_right
		if(vy>0) _correction_y = self.bbox_bottom - _collision.bbox_top
		if(vy<0) _correction_y = self.bbox_top    - _collision.bbox_bottom
	}
	_new_collision.environmental_horizontal_speed = vx + _correction_x 
	_new_collision.environmental_vertical_speed = vy + _correction_y 
}