/// @description Collision Check + Movement
// You can write your code in this editor

isPlayerOn = place_meeting(x,y-5, obj_player)

if isPlayerOn obj_player.x += vx / FRAME_RATE;