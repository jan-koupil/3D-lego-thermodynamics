$fn = 100;
scale = 1;

include <vendor\DobloFactory\doblo-factory.scad>;
//baseHeight = 19.2;
play = 0.15 / 2;
baseWidth = 32 - 2 * play;
plateHeight = 3 * 3.2 - 0 * play;

w = baseWidth / 2;
d = w;
h =  4;
n = [-0.15, 0.07, 1];
epsilon = 0.05;
write = "15:21";
textDepth = 0.2;

//
//SCALE =0.5;
//LATTICE_TYPE = 1;
//include <doblo-factory.scad>;
include <vendor\DobloFactory\lib\doblo-params.scad>;

difference(){
//       column line z-pos   width length   height nibbles diamonds, size
translate([-baseWidth / 2,baseWidth / 2,-plateHeight])
    translate([-play, play, 0])
        doblo   (0,     0,   0,      4,    4,       FULL,  false,   false,    LUGO);

translate ([0,w-1.176+textDepth+epsilon,-5])
    rotate([90,0,0])
    linear_extrude(height = textDepth) {
        text(write, size = 5, halign = "center", valign = "center");
    }
};

//translate([-w, -w,0])
//    cube([2 * w,2 * w,h]);

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
  
polyhedron( CubePoints, CubeFaces );    