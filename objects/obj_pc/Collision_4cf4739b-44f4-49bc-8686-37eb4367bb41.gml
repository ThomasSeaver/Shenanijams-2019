sticky = false;
jmpspeed = 3;
mvspeed = 2;
strong = false;
color = "brown";
image_xscale = 1;
image_yscale = 1;

room_goto(other.targetRoom);
x = other.targetX;
y = other.targetY;

global.papers += papers_room;
papers_room = 0;