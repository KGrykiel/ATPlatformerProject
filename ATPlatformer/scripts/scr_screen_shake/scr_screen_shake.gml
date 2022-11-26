// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function screen_shake(arg_0,arg_1){
	with (obj_camera)
		if (arg_0 > shake_value){
			shake_magnitude = arg_0;
			shake_value = arg_0
			shake_length = arg_1;
		}
}