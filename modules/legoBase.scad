use <helpers.scad>;

module legoBase (
    pattern = "X", //either "X" or "O"
    baseWidth,
    plateHeight,
    play,
    wall, //wall thickness
    ceiling, //ceiling thickness   
    layerHeight, //print layer height
    nozzleWidth //print nozzle width
) {

    w = baseWidth / 2; // halfwidth
    baseDim = 8; // base lego dimension
    epsilon = 0.05;

    // each inner barrel
    // innerR = 5 / 2; // original lego value
    innerR = 5 / 2;
    // outerR = 6.6 / 2; // original lego value
    outerR = 6.3 / 2;

    innerWall = 1;     // inner wall thickness

    // walls
    make_ring_of(w, 4)
        wall();

    // ceiling
    color("green", 0.2)
        translate([-w, -w, -ceiling + plateHeight]) 
            cube([baseWidth, baseWidth, ceiling]);      
 

    // inner barrels
    if (pattern == "O") {
        color("lime", 0.6) {
            for(dx = [-1 : 1 : 1]){
                for(dy = [-1 : 1 : 1]){
                    translate([dx,dy,0] * baseDim)
                        barrel();
                }
            }
        }
    } else if (pattern == "X") {
 
        color("lime", 0.6) {
            barrel();
            turnAround(4) {
                translate([baseDim, baseDim, 0]) 
                    barrel();
            }
        }

        color("blue", 0.3) {
            turnAround(4) 
            {
                translate([-w, -innerWall / 2, 0])
                    cube([w - innerR, innerWall, plateHeight - epsilon]);
            }
        }

    } else {  
        echo ("Invalid value for pattern, choose \"X\" or \"O\"'");
    }

    // ceiling grating
    color("brown") {
        turnAround(2) {
            for(dx = [-1 : 1 : 1]){
                translate([-nozzleWidth + dx * baseDim, -w, plateHeight - ceiling - 2 * layerHeight])
                    cube([2 * nozzleWidth, baseWidth, 2 * layerHeight]);
            }
        }
        turnAround(2) {
            for(dx = [-1 : 1 : 1]){
                rotate([0,0,90])
                    translate([-nozzleWidth + dx * baseDim, -w, plateHeight - ceiling - layerHeight])
                        cube([2 * nozzleWidth, baseWidth, layerHeight]);
            }
        }
    
    }

    module wall() {    
        color("red", 0.2)
        translate([-w, 0, 0])
        cube([baseWidth, wall, plateHeight - epsilon]);
    }      

    module barrel() {
        difference() {
            cylinder(r1 = outerR, r2 = outerR, h = plateHeight - epsilon);
            translate([0, 0, -epsilon])
                cylinder(r1 = innerR, r2 = innerR, h = plateHeight + 2 * epsilon);
        }    
    }       
}
