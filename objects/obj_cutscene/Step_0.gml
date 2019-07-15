time_alive += delta_time;
if (keyboard_check(vk_space) or time_alive/1000000 >= scene_length) {
	room_goto(targetRoom);
}