$fn = 100;
scale = 1;

include <vendor\DobloFactory\doblo-factory.scad>;
baseHeight = 19.2;
baseWidth = 32;
plateHeight = 10;


doblo   (-1,   -1,   0,   2,   2,    6,  false, false, DOBLO);
nibbles  (-1,  -1,   FULL,  2,   2, DOBLO);	

//translate([-baseWidth / 2,-baseWidth / 2,baseHeight])
//    cube ([baseWidth, baseWidth, plateHeight]);
    