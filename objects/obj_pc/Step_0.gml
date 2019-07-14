move_wrap(1, 1, sprite_width);

upcheck    = place_meeting(x, y - 1, obj_wall);
downcheck  = place_meeting(x, y + 1, obj_wall);
leftcheck  = place_meeting(x - 1, y, obj_wall);
rightcheck = place_meeting(x + 1, y, obj_wall);

touchingwall = upcheck or downcheck or leftcheck or rightcheck;

if (sticky and touchingwall) {
	vspeed = 0;
	jumped = false;
} else if (not downcheck) {
	vspeed += 0.1;
} else {
	jumped = false;
}

var key_right = keyboard_check(ord("D"));
var key_left  = keyboard_check(ord("A"));
var key_up    = keyboard_check(ord("W"));
var key_down  = keyboard_check(ord("S"));

hspeed = (key_right - key_left) * mvspeed;

if (key_up && !jumped) {
	vspeed = -jmpspeed;
	jumped = true;
}

if (key_down and not downcheck) {
	vspeed = mvspeed;
}

var xt = x;
var yt = y;

if (hspeed != 0 and place_meeting(xt + hspeed, yt, obj_wall)) {
	xt = round(xt);
	while (!place_meeting(xt + sign(hspeed), yt, obj_wall)) {
		xt += sign(hspeed);
	}
	hspeed = 0;
}

if (vspeed != 0 and place_meeting(xt, yt + vspeed, obj_wall)) {
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
	} else if (!place_meeting(xt - count, yt, obj_wall)) {
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
if (strong and (not instance_exists(obj_fist)) and keyboard_check(vk_space)) {
	var inst = instance_create_depth(x, y, -10000, obj_fist);
	var angle = 0;
	if (hspeed > 0 and vspeed == 0) {
		angle = 0;
	} else if (hspeed < 0 and vspeed == 0) {
		angle = 180;
	} else if (hspeed == 0 and vspeed > 0) {
		angle = 270;
	} else if (hspeed == 0 and vspeed < 0) {
		angle = 90;
	} else {
		angle = radtodeg(arctan((sign(vspeed)*vspeed)/(sign(hspeed)*hspeed)));
		if (vspeed > 0 and hspeed > 0) {
			angle = 360 - angle;
		} else if (vspeed < 0 and hspeed < 0) {
			angle = 180 - angle;
		} else if (vspeed > 0 and hspeed < 0) {
			angle = 180 + angle;
		}
	}
	inst.image_angle = angle;
	inst.direction = direction;
	inst.move_speed = 7 * (sign(hspeed) * hspeed + sign(vspeed) * vspeed);
}

if (hspeed > 0) {
	image_xscale = -1 * abs(image_xscale);
} else if (hspeed < 0) {
	image_xscale = abs(image_xscale);
}

hspeed_close = hspeed < 2 and hspeed > -2;
vspeed_close = vspeed < 1 and vspeed > -1;

image_speed = 1;

if (sticky and hspeed_close and (leftcheck or rightcheck)) {
	sprite_index = asset_get_index(string("spr_pc_climb_") + string(color));
	if (vspeed == 0) {
		image_speed = 0;
	}
} else if ((downcheck or upcheck) and vspeed_close and hspeed_close) {
	sprite_index = asset_get_index(string("spr_pc_stand_") + string(color));
} else if (not downcheck and not (sticky and upcheck)) {
	sprite_index = asset_get_index(string("spr_pc_jump_")  + string(color));
} else {
	sprite_index = asset_get_index(string("spr_pc_walk_")  + string(color));	
}

if(sticky and upcheck and not downcheck) {
	image_yscale = abs(image_yscale) * -1;	
} else {
	image_yscale = abs(image_yscale);
}