/// @description Insert description here
// You can write your code in this editor

event_inherited()

red_koopa = true;

state = walk_state;

/// @description Substate to change direction when there's a drop at the end of the platform
function bounce_on_cliff_substate() {
	if (abs(horizontal_speed) > 0) {
		if (horizontal_speed > 0) {
			border = bbox_right
		}
		else {
			border = bbox_left
		}
	
		if (!tilemap_get_at_pixel(obj_manager.collision_tilemap, border + horizontal_speed, bbox_bottom + 1)) {
			throw_lego_at_edge()
		}
	}
}

// @description Function to throw lego piece downward hopefully lol
function throw_lego_at_edge() {
	scr_create_projectile(scr_vector_to_direction(0.5,-2),[id],5,x+(32*image_xscale),y-30,,0.3);
	horizontal_speed *= -1
	image_xscale *= -1
}

