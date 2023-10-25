/// @description Insert description here
// You can write your code in this editor

if place_meeting(x +3, y+3, obj_charging_turtlebot) {
	if obj_charging_turtlebot.state = obj_charging_turtlebot.charge_state {instance_destroy()};
	with(obj_charging_turtlebot) {state = walk_state};
}
