// All functions associated with health


// Use in any object which has health

/// @desc Automatically sets variables associated with health - should be used in create event
function scr_create_health_vars(_max_health=10, _current_health=_max_health, _dead=false, _target=self){
	_target.current_health = _current_health
	_target.max_health = _max_health
	_target.dead = _dead
} 

/// @desc Automatically updates variables associated with health - should be used in step event
function scr_update_health_vars(_target=self){
	// Checks if '_target' is dead
	if _target.current_health <= 0 {
		_target.current_health = 0;
		_target.dead = true;
	}
	// Makes sure current health is not above max health
	if _target.current_health > _target.max_health {
		_target.current_health = _target.max_health
	}
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

	// If '_target' is not dead, displays its current and max health
	if variable_instance_exists(_target.id, "current_health") and variable_instance_exists(_target.id, "max_health"){
		draw_text(_target.x, _target.bbox_top, string(_target.current_health)+"/"+string(_target.max_health));
	}
}



// Can be used to interact with health of an object

/// @desc Heals '_target' (default: object which called function) by '_amount'
function scr_heal(_amount, _target=self){
	_target.current_health += _amount;
}

/// @desc Damages '_target' (default: object which called function) by '_amount'
function scr_damage(_amount, _target=self){
	_target.current_health -= _amount;
}

/// @desc Increases max health of '_target' (default: object which called function) by '_amount'
function scr_increase_max_health(_amount, _target=self){
	_target.max_health += _amount;
}

/// @desc Sets max health of '_target' (default: object which called function) to '_amount'
function scr_set_max_health(_amount, _target=self){
	_target.max_health = _amount;
}