/// @description Insert description here
// You can write your code in this editor

// basically a template for creating items
function create_item(_name, _desc, _spr) constructor {
	name = _name;
	description = _desc;
	sprite = _spr
}

// global variable that stores all item types
global.item_list = {
	dummy : new create_item("Dummy Item", "Does fuck all", spr_dummy_item)
}


