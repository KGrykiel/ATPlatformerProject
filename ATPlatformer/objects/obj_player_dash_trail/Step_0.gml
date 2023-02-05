/// @description decrease visibility with time
// Taken from this video: https://youtu.be/LRt2K9459MM?t=181

image_alpha -= trail_removal_rate;
if (image_alpha <= 0) instance_destroy();