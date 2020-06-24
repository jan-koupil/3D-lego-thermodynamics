$fn = 100;
scale = 1;
include <vendor\DobloFactory\doblo-factory.scad>;

tile (n = [0.15, 0.20, 1], h = 12);

module tile(
    n, // slope normal vector
    h, // center height over base platform
    brimWidth = 3,
    brimThickness = 0.15    
){

    // lego dimensions
    play = 0.15 / 2;
    baseWidth = 32 - 2 * play;
    plateHeight = 3 * 3.2 - 0 * play;

    w = baseWidth / 2; // halfWidth
    d = w;             // halfLength
    epsilon = 0.05;


    include <vendor\DobloFactory\lib\doblo-params.scad>;

    // place platform lego tile
color("red")
    translate([-w, w,-plateHeight])
        translate([-play, play, 0])
                // column  line z-pos width length  height  nibbles  diamonds,  size
            doblo   (0,     0,   0,    4,    4,      FULL,  false,   false,    LUGO);
    
color("green")
    translate([-w - brimWidth, -w - brimWidth, -plateHeight])
        difference(){
            cube([baseWidth + 2 * brimWidth, baseWidth + 2 * brimWidth, brimThickness]);
            
            translate([brimWidth, brimWidth, -epsilon / 2])
                cube([baseWidth - epsilon, baseWidth - epsilon, brimThickness + epsilon]);
        }


    // place the top given by normal vector of the slope
    CubePoints = [
      [ -w, -d, 0 - epsilon],  //0
      [  w, -d, 0 - epsilon],  //1
      [  w,  d, 0 - epsilon],  //2
      [ -w,  d, 0 - epsilon],  //3
      [ -w, -d, ( n.x + n.y) * w / n.z + h],  //4
      [  w, -d, (-n.x + n.y) * w / n.z + h],  //5
      [  w,  d, (-n.x - n.y) * w / n.z + h],  //6
      [ -w,  d, ( n.x - n.y) * w / n.z + h]   //7
      ];
    CubeFaces = [
      [0,1,2,3],  // bottom
      [4,5,1,0],  // front
      [7,6,5,4],  // top
      [5,6,2,1],  // right
      [6,7,3,2],  // back
      [7,4,0,3]]; // left
      
//color("orange")
//    polyhedron( CubePoints, CubeFaces );    
}