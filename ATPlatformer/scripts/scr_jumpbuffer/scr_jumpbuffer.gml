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
function scr_jump_buffer(range)
{
	var jump_buffer = false;
	var _time_source = time_source_create(time_source_game, range, time_source_units_frames, _clear_jump_buffer);

	if (state == PlayerStateAir)	
	{
		if (key_jump)
		{
			time_source_start(_time_source);
			// start counting
			while (_time_source.time_source_get_state() == 1)
			{
				if (key_jump)
					time_source_restart(_time_source);
				jump_buffer = true;
			}
		}
	}
	return jump_buffer;
}

function _clear_jump_buffer()
{
	jump_buffer = false;
}
