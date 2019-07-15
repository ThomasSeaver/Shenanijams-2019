if (not (color == "yellow")) {
	y = 160;
	x = 20;
	hspeed = 0;
	vspeed = 0;
	global.deaths++;
	papers_room = 0;
	room_restart();
	sticky = false;
	jmpspeed = 3;
	mvspeed = 2;
	strong = false;
	color = "brown";
	image_xscale = 1;
	image_yscale = 1;
}