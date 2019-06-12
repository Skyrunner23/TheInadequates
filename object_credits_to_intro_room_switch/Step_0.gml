/// @description Switch Rooms
var (switch_key) = keyboard_check_pressed(vk_escape);

if(switch_key)
{
	room_goto(new_room);
}
