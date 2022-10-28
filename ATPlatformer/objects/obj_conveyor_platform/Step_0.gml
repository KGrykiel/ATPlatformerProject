/// @description Collision Check + Movement
// You can write your code in this editor
event_inherited()

//set conveyor speed to positive values to go right, negative to go left
for (var _i=0; _i<ds_list_size(list_entities_on);_i++){
	var _entity = ds_list_find_value(list_entities_on, _i)
	_entity.environmental_horizontal_speed = conveyor_speed
}