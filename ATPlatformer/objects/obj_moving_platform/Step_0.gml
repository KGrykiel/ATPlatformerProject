 /// @description Checks for nearby player

event_inherited()


if isPlayerOn {
	// If player is on top of platform, moves player with platform
	if obj_player.bbox_bottom - 5 <= bbox_top {
		obj_player.x += vx;
		obj_player.y += bbox_top - obj_player.bbox_bottom;
	}
	// If player is colliding with bottom of platform teleports to top of platform
	else if obj_player.bbox_right -5 > bbox_left and obj_player.bbox_left +5 < bbox_right  {
			obj_player.y += bbox_top - obj_player.bbox_bottom;
			show_debug_message("Moving platform hit top of player");
	}
	// If player is colliding with the side of platform, moves player horizontally with platform
	else {
			obj_player.x += vx;
			//show_debug_message(vx)
		}
}
