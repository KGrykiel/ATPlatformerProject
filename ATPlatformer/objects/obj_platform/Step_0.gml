/// @description Insert description here
// You can write your code in this editor

// changed as the game crashes on startup after merge
list_entities_on = ds_list_create(); //ds_list_destroy(list_entities_on)
//Makes a list of all instances inheriting from obj_character that are currently standing on the platform
with(obj_character){
	if(place_meeting(x,y+1, other) && !place_meeting(x,y, other)){
		ds_list_add(other.list_entities_on,self)
	}
}