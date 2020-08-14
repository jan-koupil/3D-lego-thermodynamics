// expects parameters x and y element of <0,6>
// example use: "c:\Program Files\OpenSCAD\openscad.com" -o stl\tile_6_3.stl -D "x=6" -D "y=3" cmdline_tile.scad

include <config.scad>;
use <modules\tile_module.scad>;

x=0; y=0; //magic code, dont ask me why

// creates brim on real outside only
brimWidth = 3;
brimThickness = 0; // set here, or leave 0 and use your slicer settings

/* dQ */
// midHeight = 38;
// slopeN = [-95 / 12 * y, -57 / 12 * x, 32];

/* dU */
midHeight = 29;
slopeN = [-57 / 12 * y, -57 / 12 * x, 32];

tile (n = slopeN, h = midHeight, brimWidth = brimWidth, brimThickness = brimThickness);
