move_wrap(1, 1, sprite_width);

if (!place_meeting(x, y + 1, obj_wall)) {
	vspeed += 0.1;
} else {
	jumped = false;
}

var key_right = keyboard_check(ord("D"));
var key_left  = keyboard_check(ord("A"));
var key_up    = keyboard_check(ord("W"));
var key_down  = keyboard_check(ord("S"));

hspeed = (key_right - key_left) * mvspd;

if (key_up && !jumped) {
	vspeed = -mvspd;
	jumped = true;
}

if (key_down) {
	vspeed = mvspd;
}

var xt = x;
var yt = y;

if (place_meeting(xt + hspeed, yt, obj_wall)) {
	xt = round(xt);
	while (!place_meeting(xt + sign(hspeed), yt, obj_wall)) {
		xt += sign(hspeed);
	}
	hspeed = 0;
}

if (place_meeting(xt, yt + vspeed, obj_wall)) {
	yt = round(yt);
	while (!place_meeting(xt, yt + sign(vspeed), obj_wall)) {	
		yt += sign(vspeed);
	}
	vspeed = 0;
} 
count = 1;
while (place_meeting(xt, yt, obj_wall)) {
	if (!place_meeting(xt + count, yt, obj_wall)) {
		xt += count;	
	} else if (!place_meeting(xt- count, yt, obj_wall)) {
		xt -= count;	
	} else if (!place_meeting(xt, yt + count, obj_wall)) {
		yt += count;	
	} else if (!place_meeting(xt, yt - count, obj_wall)) {
		yt -= count;	
	}
	count++;
}

x = xt;
y = yt;
show_debug_message("x: " + string(x) + " y: " + string(y));