if (dist_traveled == 0) {
	move_speed += 4;
}


if (dist_traveled < 12) {
	if (!(image_angle <= 360 and image_angle >= 0)) {
		image_angle = 0;
	}
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