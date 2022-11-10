/// @description Insert description here
// You can write your code in this editor

switch(state) 
{
 	case STATE_INTERACTABLE_BOX.idle:
 		image_speed = 0;
 		image_index = 0;
 		// code to be executed when box is idle goes here
 	break;
 	case STATE_INTERACTABLE_BOX.opened:
 		image_speed = 0;
 		image_index = 1;
 		// code to be executed when box is open goes here
 	break;
 }
 

function scr_interactable_box()
{
	if(state == STATE_INTERACTABLE_BOX.idle)
	{
 	state = STATE_INTERACTABLE_BOX.opened;
 	// object will change state to opeend when the current state is idle
	}
}