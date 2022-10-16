// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/*
 * @description This script is to handle jump input while in mid-air.
 * Whenever a player inputs a jump input in mid-air,
 * It would be buffered.
 * If the player enters the state that they can jump after a given range of time,
 * the script would issue the buffered jump command
 * and the player will jump
 * @param range Int gives the interval of time that we keep the buffer
 * @return Bool whether we should jump when we enter the state
**/
function scr_jump_buffer()
{
	time_source_start(jump_buffer_time_source);
	jump_buffer = true;
}

function _clear_jump_buffer()
{
	jump_buffer = false;
}
