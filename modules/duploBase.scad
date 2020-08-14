use <helpers.scad>;

module duploBase (
    baseWidth,
    plateHeight,
    play,
    wall, //wall thickness
    ceiling, //ceiling thickness   
    layerHeight, //print layer height
    nozzleWidth //print nozzle width
) {
    w = baseWidth / 2; // halfwidth
    epsilon = 0.05;

    // small blocks on cube sides
    sideBlockL = 3.2;
    sideBlockT = 1.2;
    // sideBlockRaise = 0.2; // lego original
    sideBlockRaise = 0;
    
    // central barrel
    innerR = 10.7 / 2;
    // outerR = 13.3 / 2; // lego original
    outerR = 13.5 / 2;
    centralRingRaise = 2;


    // walls
    make_ring_of(w, 4)
        wall();

    // top
    color("green", 0.2)
        translate([-w, -w, -ceiling + plateHeight]) 
            cube([baseWidth, baseWidth, ceiling]);        
        
    // barrel
    color("yellow", 0.5)
    translate([0, 0, centralRingRaise])
        difference() {
            cylinder(r1 = outerR, r2 = outerR, h = plateHeight -centralRingRaise - epsilon);
            translate([0, 0, -epsilon])
                cylinder(r1 = innerR, r2 = innerR, h = plateHeight -centralRingRaise + epsilon);

        }

    module wall() {    
        color("red", 0.2)
        translate([-w, 0, 0])
        cube([baseWidth, wall, plateHeight - epsilon]);

        color("blue", 0.2) {
            translate([16.2 / 2, 0, sideBlockRaise])
            cube([sideBlockT, sideBlockL, plateHeight - sideBlockRaise - epsilon]);

            translate([-16.2 / 2, 0, sideBlockRaise])
            cube([sideBlockT, sideBlockL, plateHeight - sideBlockRaise - epsilon]);
        }
    }


    // ring support
    r = (innerR + outerR) /2;
    a = 1.8;
    n = 6;
    factor = 0.1;

    x1 = function(t) (r * (1 + factor) + a * sin(n * t * 360 )) * cos (t * 360 );
    y1 = function(t) (r * (1 + factor) + a * sin(n * t * 360 )) * sin (t * 360 );

    x2 = function(t) (r * (1 - factor) + a * sin(n * t * 360 )) * cos (t * 360 );
    y2 = function(t) (r * (1 - factor) + a * sin(n * t * 360 )) * sin (t * 360 );

    points_1 = parametric_points(fx=x1, fy=y1, t0=0, t1=1);
    points_2 = parametric_points(fx=x2, fy=y2,t0=0, t1=1);

    color("lime", 0.4)
    linear_extrude(centralRingRaise)
    union() {
        polygon(
            concat(
                points_1,
                points_2
            )
        );
    
    }

    //ceiling grating

    color("brown") {
    make_ring_of(w, 4)
        translate([-nozzleWidth, 0, plateHeight - ceiling - layerHeight])
            cube([2 * nozzleWidth, w - epsilon, layerHeight]);

    turnAround(4)
    translate([w - nozzleWidth * sqrt(2), 0, 0])
    rotate([0,0,45])
    translate([-nozzleWidth + epsilon, 0,  plateHeight - ceiling - 2 * layerHeight])
        cube([2 * nozzleWidth, w * sqrt(2) - nozzleWidth - 2 * epsilon, 2 * layerHeight]);

    translate([-nozzleWidth , -outerR,  plateHeight - ceiling - 2 * layerHeight])
        cube([2 * nozzleWidth, 2 * outerR, 2 * layerHeight]);

    turnAround(4)
    rotate([0,0,45])
    translate([-nozzleWidth + epsilon, 0,  plateHeight - ceiling - layerHeight])
        cube([2 * nozzleWidth, w * sqrt(2) - nozzleWidth - 2 * epsilon, layerHeight]);
    
    }

}