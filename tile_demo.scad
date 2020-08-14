include <config.scad>;
use <modules\tile_module.scad>;

brimWidth = 0;
brimThickness = 0.15;

x = 6;
y = 6;

tile (
    n = [-57/12 * y, -57/12 * x, 32], 
    h = 29, 
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
 