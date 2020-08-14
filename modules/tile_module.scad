
use <..\vendor\roundedcube.scad>; 
use <baseplate.scad>; 
 
module tile (
    n, // slope normal vector
    h, // center height over base platform,
    baseWidth,
    plateHeight,
    play,
    wall,
    ceiling,
    baseType,
    layerHeight,
    nozzleWidth,
    brimWidth = 0,
    brimThickness = 0     
) {

    w = baseWidth / 2; // halfWidth
    epsilon = 0.05;

    // place platform lego tile

    color("red", 0.6)
        translate([0,0,-plateHeight])
            basePlate(  
                type = baseType,   
                baseWidth = baseWidth,
                plateHeight = plateHeight,
                play = play,
                wall = wall, //wall thickness
                ceiling = ceiling, //ceiling thickness
                layerHeight = layerHeight, //print layer height
                nozzleWidth = nozzleWidth //print nozzle width
            );


    // create printing "brim"
    if (brimWidth > 0 && brimThickness > 0)
    color("green")
        translate([0 , 0 , -plateHeight])
            difference(){
                linear_extrude(height = brimThickness, center = false)
                    offset(r = brimWidth)
                        square(size = baseWidth, center = true);
                
                translate([0, 0, (brimThickness - epsilon) / 2])
                    cube([baseWidth - epsilon, baseWidth - epsilon, brimThickness + epsilon + 1], center = true);
            }


    // place the top given by normal vector of the slope
    CubePoints = [
      [ -w, -w, 0 - epsilon],  //0
      [  w, -w, 0 - epsilon],  //1
      [  w,  w, 0 - epsilon],  //2
      [ -w,  w, 0 - epsilon],  //3
      [ -w, -w, ( n.x + n.y) * w / n.z + h],  //4
      [  w, -w, (-n.x + n.y) * w / n.z + h],  //5
      [  w,  w, (-n.x - n.y) * w / n.z + h],  //6
      [ -w,  w, ( n.x - n.y) * w / n.z + h]   //7
      ];
    CubeFaces = [
      [0,1,2,3],  // bottom
      [4,5,1,0],  // front
      [7,6,5,4],  // top
      [5,6,2,1],  // right
      [6,7,3,2],  // back
      [7,4,0,3]]; // left
      
    color("lime", 0.6)
        polyhedron( CubePoints, CubeFaces );    
}