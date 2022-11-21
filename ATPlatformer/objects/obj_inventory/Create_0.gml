/// @description Insert description here
// You can write your code in this editor
#macro INVENTORY_SIZE 15
rowLength = 6
inventory = array_create(INVENTORY_SIZE, -1)
inventory[0] = instance_create_layer(x,y,"Instances", obj_item_parent)

function inventory_search(itemType) {
	for (var i = 0; i < INVENTORY_SIZE; i+=1) {
		if (inventory[i] == itemType) { return i; }
	}
	return -1;
}

function inventory_add(itemType) {
	slot = inventory_search(-1);
	if (slot != -1) {
		inventory[slot] = itemType;
		return true;
	}
	else return false;
}

function inventory_remove(itemType) {
	slot = inventory_search(itemType);
	if (slot != -1) {
		inventory[slot] = -1;
		return true;
	}
	else return false;
}