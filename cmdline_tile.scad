$fn = 30;
use <tile_module.scad>;

//expects parameters x and y element of <0,6>

// x = 6;
// y = 5;
//echo (x=x, y=y);
x=0; y=0; //magic code, dont ask me why

// creates brim on real outside only
brimWidth = 3;
brimThickness = 0; // set here, or leave 0 and use your slicer settings

// dQ
// midHeight = 38;
//slopeN = [-95 / 12 * y, -57 / 12 * x, 32];

// dU
midHeight = 29;
slopeN = [-57 / 12 * y, -57 / 12 * x, 32];

tile (n = slopeN, h = midHeight, brimWidth = brimWidth, brimThickness = brimThickness);
