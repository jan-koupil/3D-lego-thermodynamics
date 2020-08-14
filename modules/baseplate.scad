use <..\vendor\DobloFactory\doblo-factory.scad>;
include <..\vendor\DobloFactory\lib\doblo-params.scad>; 
use <duploBase.scad>;
use <legoBase.scad>;

module basePlate(
    type,
    baseWidth,
    plateHeight,
    play,
    wall, //wall thickness
    ceiling, //ceiling thickness   
    layerHeight, //print layer height
    nozzleWidth //print nozzle width        
) {

    w = baseWidth / 2; // halfWidth
    epsilon = 0.05;

    if (type == "doblo-factory") {
        translate([-w -play, w + play, 0])
                    // column  line z-pos width length  height  nibbles  diamonds,  size
                doblo   (0,     0,   0,    4,    4,      FULL,  false,   false,    LUGO);
    } else if (type == "duplo") {
        duploBase (
            baseWidth = baseWidth,
            plateHeight = plateHeight, 
            play = play,
            wall = wall, //wall thickness
            ceiling = ceiling, //ceiling thickness   
            layerHeight = layerHeight, //print layer height
            nozzleWidth = nozzleWidth //print nozzle width
        );
    } else if (type == "lego-x") {
        legoBase (
            baseWidth = baseWidth,
            plateHeight = plateHeight,
            play = play,
            wall = wall, //wall thickness
            ceiling = ceiling, //ceiling thickness   
            pattern = "X",
            layerHeight = layerHeight, //print layer height
            nozzleWidth = nozzleWidth //print nozzle width
        );   
    } else if (type == "lego-o") {
        legoBase (
            baseWidth = baseWidth,
            plateHeight = plateHeight,
            play = play,
            wall = wall, //wall thickness
            ceiling = ceiling, //ceiling thickness   
            pattern = "O",
            layerHeight = layerHeight, //print layer height
            nozzleWidth = nozzleWidth //print nozzle width
        );   
    } else {
        echo ("Invalid pattern type - choose from doblo-factory/duplo/lego-x/lego-o");
    }
}