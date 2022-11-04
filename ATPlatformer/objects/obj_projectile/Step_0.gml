/// @description Movement

// Destroys projectile if it goes off the screen
if bbox_right < 0 or bbox_left > room_width or bbox_bottom < 0 or bbox_top > room_height {
	instance_destroy();
}

// Updates x and y positions of projectile
x += horizontal_speed
y += vertical_speed
