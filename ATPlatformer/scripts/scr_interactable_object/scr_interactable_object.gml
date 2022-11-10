// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_interactable_object(){
	if(state == STATE_INTERACTABLE_BOX.idle)
	{
 	state = STATE_INTERACTABLE_BOX.opened;
 	// object will change state to opeend when the current state is idle
	}
}