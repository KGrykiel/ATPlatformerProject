/// @description If it hits a character

// id of object which it hit
var _currently_colliding = instance_place(x,y,obj_character)

var _ignore_collision = false
for (var _i = 0; _i < array_length(immune_characters); _i += 1)
{
    if _currently_colliding == immune_characters[_i]
	_ignore_collision = true
}

if not _ignore_collision {
	show_debug_message("Projectile hit " + string(_currently_colliding))

	instance_destroy()
}