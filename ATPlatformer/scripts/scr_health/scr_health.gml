// All functions associated with health


// Use in any object which has health

/// @desc Automatically sets variables associated with health - should be used in create event
function scr_create_health_vars(_max_health=10, _current_health=_max_health, _dead=false, _target=self){
	_target.current_health = _current_health
	_target.max_health = _max_health
	_target.dead = _dead
} 

/// @desc (temporary) Draws health bar of '_target' (default: object which called function) - should be used in draw event (remember draw_self())
function scr_draw_health_bar(_target=self){
	// Sets alignment of health bar
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	
	// If '_target' is dead, puts 'Dead' in place of health bar
	if _target.dead{
		draw_text(_target.x, _target.bbox_top, "Dead");
		return
	}

	// If '_target' is not dead and 'current_health'/'max_health' exist, displays its current and max health
	if variable_instance_exists(_target.id, "current_health") and variable_instance_exists(_target.id, "max_health"){
		draw_text(_target.x, _target.bbox_top, string(_target.current_health)+"/"+string(_target.max_health));
	}
}



// Can be used to interact with health of an object

/// @desc Heals '_target' (default: object which called function) by '_amount'
function scr_heal(_amount, _target=self){
	_target.current_health += _amount;
	scr_update_health_vars(_target);
}

/// @desc Damages '_target' (default: object which called function) by '_amount'
function scr_damage(_amount, _target=self){
	_target.current_health -= _amount;
	scr_update_health_vars(_target);
}

/// @desc Increases max health of '_target' (default: object which called function) by '_amount'
function scr_increase_max_health(_amount, _target=self){
	_target.max_health += _amount;
	scr_update_health_vars(_target);
}

/// @desc Sets max health of '_target' (default: object which called function) to '_amount'
function scr_set_max_health(_amount, _target=self){
	_target.max_health = _amount;
	scr_update_health_vars(_target);
}

/// @desc Sets current health of '_target' (default: object which called function) to '_amount'
function scr_set_current_health(_amount, _target=self){
	_target.current_health = _amount;
	scr_update_health_vars(_target);
}

/// @Desc Returns what fraction of health '_target' (default: object which called function) has remaining as a decimal
function scr_get_health_dec(_target=self){
	return _target.current_health / _target.max_health;
}
	
	
// Following are used in other health funcitons
	
/// @desc Automatically updates variables associated with health - used in other health functions
function scr_update_health_vars(_target=self){
	// Checks if '_target' is dead
	if _target.current_health <= 0 {
		_target.current_health = 0;
		_target.dead = true;
	}
	else {
		_target.dead = false
	}
	// Makes sure current health is not above max health
	if _target.current_health > _target.max_health {
		_target.current_health = _target.max_health
	}
}