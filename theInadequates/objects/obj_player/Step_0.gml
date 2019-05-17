key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

// booleans are 1 or 0 in gml, so you can subtract them like ints
var move = key_right - key_left;
// 'var' means it'll get deleted after this frame

hsp = move * wsp;
// remember move might be negative
vsp += g; // down is positive y axis

// only jump if your feet are on the ground
if (place_meeting(x, y + 1, obj_wall) && key_jump)
{
	vsp = -9;
}

// this checks to see if you will collide with a wall (sideways)
if (place_meeting(x + hsp, y, obj_wall))
{
	// scoot as close to the wall as possible without colliding
	while (!place_meeting(x + sign(hsp), y, obj_wall))
	// sign(num) returns 1 if num > 0 and -1 if num < 0
	{
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

// and this section is for colliding with the floor
if (place_meeting(x, y + vsp, obj_wall))
{
	// scoot as close to the floor as possible without colliding
	while (!place_meeting(x, y + sign(vsp), obj_wall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

if (keyboard_check(vk_numpad7))
{
	sprite_index = spr_phaius_player;
}