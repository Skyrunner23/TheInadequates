key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

// booleans are 1 or 0 in gml, so you can subtract them like ints
var move = key_right - key_left;
// 'var' means it'll get deleted after this frame

hsp = move * wsp;
// remember move might be negative

// this checks to see if you will collide with a wall (sideways)
if (place_meeting(x + hsp, y, obj_wall))
{
	// scoot as close to the wall as possible without colliding
	while (!place_meeting(x + sign(hsp), y, obj_wall))
	{
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;