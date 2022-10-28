/// @description Insert description here
// You can write your code in this editor

ds_list_clear(list_entities_on)

with(obj_character){
	if(place_meeting(x,y+1, other) && !place_meeting(x,y, other)){
		ds_list_add(other.list_entities_on,self)
	}
}