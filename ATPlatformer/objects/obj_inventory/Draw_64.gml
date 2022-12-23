/// @description Insert description here
// You can write your code in this editor

draw_sprite_stretched(spr_inventory_bg, 0, grid_x, grid_y ,rowLength*36, (ceil(INVENTORY_SIZE/rowLength)) * 36)

for (var i = 0; i < INVENTORY_SIZE; i+=1) {
	var xx = grid_x + (i mod rowLength) * 36 + 2;
	var yy = grid_y + (i div rowLength) * 36 + 2;
	draw_sprite(spr_slot,0,xx,yy)
	if (inventory[i] != -1) {
		draw_sprite(inventory[i].sprite,0,xx,yy)	
	}
}


