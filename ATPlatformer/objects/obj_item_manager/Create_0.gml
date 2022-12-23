/// @description Insert description here
// You can write your code in this editor

function create_item(_name, _desc, _spr) constructor {
	name = _name;
	description = _desc;
	sprite = _spr
}

global.item_list = {
	dummy : new create_item("Dummy Item", "Fuck All", spr_item_default)
}


