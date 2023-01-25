/// @description Insert description here
// You can write your code in this editor

// basically a template for creating items
function create_item(_name, _desc, _spr, _effect) constructor {
	name = _name;
	description = _desc;
	sprite = _spr
	effect = _effect
}

// global variable that stores all item types
global.item_list = {
	dummy : new create_item("Dummy Item", "Does fuck all; single-use item", spr_dummy_item,
							function() { 
								audio_play_sound(snd_dummy_item, 1, false)
								obj_inventory.inventory[obj_inventory.selected_item_index] = -1
							}),
	dummy2 : new create_item("Sonic Screwdriver", 
							"Hey bb, are u a dr? bc when i look at you i wan2 go 'oooo weee oooo'; multi-use item", 
							spr_sonic_screwdriver,
							function() {
								audio_play_sound(snd_sonic_screwdriver, 1, false)
							})
}


