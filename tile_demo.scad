$fn = 30;
use <tile_module.scad>;

brimWidth = 0;
brimThickness = 0.15;

x = 6;
y = 6;

tile (n = [-57/12 * y, -57/12 * x, 32], h = 29, brimWidth = brimWidth, brimThickness = brimThickness);
