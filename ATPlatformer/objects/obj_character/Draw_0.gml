/// @description Insert description here
// If you want to extend the draw event, you can 
// inherit the event in a child object, apply shaders in the
// draw event, and instead of calling draw_self, call event_inherited()

if (use_healthbar) {
	draw_health_bar();
}

if (use_hitflash && in_hitflash) {
	shader_set(shd_hitflash);
}

if (iframes % 2 == 0) draw_self(); 

shader_reset();


















