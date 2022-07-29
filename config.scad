$fn = 30;

baseType = "lego-x";
// Allowed values are "doblo-factory", "duplo", "lego-x" and "lego-o"

play = 0.15; // this is reduced on each side of the brick from the base width 
// to make space for neighbouring cube
baseDim = 8; // this is lego base dimension

baseWidth = 4 * baseDim - 2 * play;
plateHeight = 3 * 3.2 - 0 * play;

wall = 1.35; //wall thickness - lego original value 1.6
ceiling = 1.4; //ceiling thickness - lego original value 1.6

layerHeight = 0.2; //print layer height
nozzleWidth = 0.4; //print nozzle width

// creates brim on real outside only, instead of slicer
brimWidth = 3;
brimThickness = 0; // set here, or leave 0 and use your slicer settings

//nop dimensions - for the 0.5 height tiles
nopDiameter = 4.95;//original value is 4.8
nopHeight = 1.9;//original value is 1.7