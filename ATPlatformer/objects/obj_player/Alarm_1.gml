/// @description Dash Time Countdown
// You can write your code in this editor

dashing = false;



// Either returns to free state, or some other unfree state

// Stops you from dashing a second time in midair if you had some contact with the ground
// but are now midair
dash_ground_reset = false;

if (grounded) {
    state = player_state_free;
} else {
    unfree_player();
}