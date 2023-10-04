/// @description Insert description here
// You can write your code in this editor


#region Health System
// Max health is defined in object variables and can be overridden in children & instances
current_health = max_health;

// The one true implementation of iframes DO NOT USE ANYTHING ELSE
iframes = 0;
in_hitflash = false;

is_invincible = function() {
	return iframes > 0;
}

draw_health_bar = function() {
	// Sets alignment of health bar
	draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
	
	draw_text(x, bbox_top, $"{current_health}/{max_health}");
	
    draw_set_valign(fa_top);
}


// damage may be replaced with a struct detailing the context of the attack
// if we need more complex reactions to damage, until then KISS
apply_damage = function(damage) {
	current_health -= damage;
	if (current_health <= 0) {
		current_health = 0;
		state = dead_state;
	}
}

apply_impulse = function(horizontal, vertical) {
	horizontal_speed += horizontal;
	vertical_speed += vertical;
}

#endregion
#region Physics

horizontal_speed = 0;
vertical_speed = 0;
environmental_horizontal_speed = 0;
environmental_vertical_speed = 0;
resistance = 0.2;

#endregion



