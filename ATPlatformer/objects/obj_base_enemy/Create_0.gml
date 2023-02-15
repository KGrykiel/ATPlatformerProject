/// @description Insert description here
// You can write your code in this editor

event_inherited();
environmental_horizontal_speed = 0;
environmental_vertical_speed = 0;
grav = 0.5;
horizontal_knockback = 10;
vertical_knockback = 5;
particle_system = part_system_create();

default_particle = part_type_create();
part_type_shape(default_particle, pt_shape_square);
part_type_scale(default_particle,1,1)
part_type_size(default_particle,0.05,0.10,-.001,0)
part_type_colour2(default_particle,$1AA3FF,$002EE6);
part_type_alpha2(default_particle,1,0);
part_type_speed(default_particle,1.25,1.25,0,0);
part_type_direction(default_particle,0,359,0,0);
//part_type_gravity(esplode_particle,0.25,270);
part_type_orientation(default_particle,0,359,10,0,true) // useless cos disk but here for reference
part_type_life(default_particle,40,50);
part_type_blend(default_particle,true);

function idle_state() {}

state = idle_state













