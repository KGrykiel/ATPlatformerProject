/// @description Dash Time Countdown
// You can write your code in this editor

// todo - check state it should be
dashing = false;
// todo - Add a cooldown with another alarm

// Either returns to free state, or some other unfree state
if (grounded) {
    state = player_state_free;
} else {
    unfree_player();
}