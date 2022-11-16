/// @description Insert description here
// You can write your code in this editor

camera = camera_create();

//Funky matrix thing that tells camera where to look, check Game Maker Manual to find out how it works
var _view_maxtrix = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);

//Orthographic Projection Matrix - gives flat view to elements drawn
//Depth can be shown through art design (or parallax scrolling for backgrounds)
var _projection_matrix = matrix_build_projection_ortho(width, height, 1, 10000); 

camera_set_view_mat(camera, _view_maxtrix);
camera_set_proj_mat(camera,_projection_matrix);

view_camera[0] = camera;

//following = noone; // Camera static at position placed in room
following = obj_player // Can change which object just doing following = {new object / instance }

x_to = x;
y_to = y;

//screenshake
screen_shake = true;
shake_power = 15;
shake_value = 0;


