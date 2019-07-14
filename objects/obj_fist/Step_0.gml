if (dist_traveled == 0) {
	show_debug_message(move_speed);
	move_speed += 4;
}


if (dist_traveled < 12) {
	var frame_speed = move_speed * delta_time/1000000;
	var xt = frame_speed * radtodeg(cos(degtorad(image_angle)));
	var yt = -1 * frame_speed * radtodeg(sin(degtorad(image_angle)));
	dist_traveled += sqrt(power(xt, 2) + power(yt, 2));
	
	x += xt;
	y += yt;
} else {
	image_alpha -= 0.05;
	if (image_alpha <= 0) {
		instance_destroy();
	}
}