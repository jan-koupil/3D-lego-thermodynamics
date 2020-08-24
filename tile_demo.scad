include <config.scad>;
use <modules\tile_module.scad>;

x = 6;
y = 6;

tile (
    // n = [-57/12 * y, -57/12 * x, 32], 
    // h = 29, 
    n = [0, 0, 1], 
    h = 0.05, 
    baseWidth = baseWidth,
    plateHeight = plateHeight,
    baseType = baseType,
    play = play, 
    wall = wall,
    ceiling = ceiling,
    layerHeight = layerHeight,
    nozzleWidth = nozzleWidth,
    brimWidth = brimWidth, 
    brimThickness = brimThickness
);
 