$fn = 50;
    // lego dimensions
    // play = 0.15 / 2;
    play = 0.15;
    baseWidth = 32 - 2 * play;
    
    plateHeight = 3 * 3.2 - 0 * play;
    // plateHeight = 1.5 * 3.2 - 0 * play;

    w = baseWidth / 2; // halfWidth
    // t = 1.6; //wall thickness
    t = 1.35; //wall thickness
    //c = t; //ceiling thickness
    c = 0.6; //ceiling thickness
    epsilon = 0.05;

    // sideBlockL = 3.2;
    sideBlockL = 3.2;
    sideBlockT = 1.2;
    // sideBlockRaise = 0.2;
    sideBlockRaise = 0;
    
    innerR = 10.7 / 2;
    // outerR = 13.3 / 2;
    outerR = 13.5 / 2;
    barrelRaise = 2;

    layerHeight = 0.2; //print layer height
    nozzleWidth = 0.4; //print nozzle width


make_ring_of(w, 4)
    wall();

color("green", 0.2)
    translate([-w, -w, -c + plateHeight]) {
        cube([baseWidth, baseWidth, c]);        
    }

color("yellow", 0.5)
translate([0, 0, barrelRaise])
difference() {
    cylinder(r1 = outerR, r2 = outerR, h = plateHeight -barrelRaise - epsilon);
    translate([0, 0, -epsilon])
        cylinder(r1 = innerR, r2 = innerR, h = plateHeight -barrelRaise + epsilon);
        
    // color("orange")
    // cylinder(r1 = outerR + epsilon, r2 = outerR + epsilon, h = layerHeight);
}

module wall() {    
    color("red", 0.2)
    translate([-w, 0, 0])
    cube([baseWidth, t, plateHeight - epsilon]);

    color("blue", 0.2) {
        translate([16.2 / 2, 0, sideBlockRaise])
        cube([sideBlockT, sideBlockL, plateHeight - sideBlockRaise - epsilon]);

        translate([-16.2 / 2, 0, sideBlockRaise])
        cube([sideBlockT, sideBlockL, plateHeight - sideBlockRaise - epsilon]);
    }
}

module make_ring_of(radius, count)
{
    for (a = [0 : count - 1]) {
        angle = a * 360 / count;
        translate(radius * [sin(angle), -cos(angle), 0])
            rotate([0, 0, angle])
                children();
    }
}    


module turnAround(count)
{
    for (a = [0 : count - 1]) {
        angle = a * 360 / count;
            rotate([0, 0, angle])
                children();
    }
} 


// barrel support
function parametric_points(fx, fy, t0=0, t1=10, delta=0.01) 
= [for(i = [t0:delta:t1]) [fx(i), fy(i)]];


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
linear_extrude(barrelRaise)
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
    translate([-nozzleWidth, 0, plateHeight - c - layerHeight])
        cube([2 * nozzleWidth, w - epsilon, layerHeight]);

turnAround(4)
translate([w - nozzleWidth * sqrt(2), 0, 0])
rotate([0,0,45])
translate([-nozzleWidth + epsilon, 0,  plateHeight - c - 2 * layerHeight])
    cube([2 * nozzleWidth, w * sqrt(2) - nozzleWidth - 2 * epsilon, 2 * layerHeight]);

translate([-nozzleWidth , -outerR,  plateHeight - c - 2 * layerHeight])
    cube([2 * nozzleWidth, 2 * outerR, 2 * layerHeight]);

turnAround(4)
rotate([0,0,45])
translate([-nozzleWidth + epsilon, 0,  plateHeight - c - layerHeight])
    cube([2 * nozzleWidth, w * sqrt(2) - nozzleWidth - 2 * epsilon, layerHeight]);
 
}