/// @description Insert description here
// You can write your code in this editor

// once again, lovingly stolen from shaun spalding's youtube tutorials

// the 36 here is assuming that the "slot" sprite itself is 32x32,
// plus 4 pixels for the gap between the slots (change this later!)

if (keyboard_check(ord("L"))) {
	draw_sprite_stretched(spr_inventory_bg, 0, obj_camera.x,obj_camera.y,rowLength*36, (ceil(INVENTORY_SIZE/rowLength)) * 36)

	for (var i = 0; i < INVENTORY_SIZE; i+=1) {
		var xx = obj_camera.x + (i mod rowLength) * 36 + 2;
		var yy = obj_camera.y + (i div rowLength) * 36 + 2;
		draw_sprite(spr_slot,0,xx,yy)
		if (inventory[i] != -1) {
			draw_sprite(inventory[i].sprite,0,xx,yy)	
		}
	}
}