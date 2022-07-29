include <config.scad>;
use <modules\baseplate.scad>;

height = 1.5 * 3.2 - 0 * play;


translate ([0,0,-height])
basePlate(   
    type = "lego-x",   
    baseWidth = baseWidth,
    plateHeight = height,
    play = play,
    wall = wall, //wall thickness
    ceiling = ceiling, //ceiling thickness
    layerHeight = layerHeight, //print layer height
    nozzleWidth = nozzleWidth //print nozzle width
); 

for (x = [-1.5 * baseDim : baseDim : 1.5 * baseDim]) {
    for (y = [-1.5 * baseDim : baseDim : 1.5 * baseDim]) {
        translate([x,y,nopHeight / 2]){
            cylinder(r=nopDiameter / 2, h=nopHeight, center=true);
        }
    }    
}