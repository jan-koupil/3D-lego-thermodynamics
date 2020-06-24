$fn = 50;
use <tile_module.scad>;
include <tile_definitions.scad>;

// definitions to change
tileSize = 32;
gap = 4; // gap between tiles
bedWidth = 100; //print bed dimensions
bedLength = 150;

setNo = 1; // which group of tiles to create, start with 1

brimWidth = 4;
brimThickness = 0.15;


// calculations - do not touch
columns = floor( (bedWidth - 2 * brimWidth) / tileSize);
rows = floor( (bedLength - 2 * brimWidth) / tileSize);
setSize = columns * rows;
sets = ceil (len(definitions) / setSize);

startIndex = (setNo - 1) * setSize;
endIndex = min (startIndex + setSize - 1, len(definitions) - 1);
echo(sets=sets, setNo=setNo, startIndex=startIndex, endIndex=endIndex, columns=columns, rows=rows);

for (i = [startIndex : endIndex]) {
    j = i - startIndex;
    xOffset = j % columns;
    yOffset = floor(j / columns) % rows;
    echo(i=i, j=j, xOffset=xOffset, yOffset=yOffset);
    translate([
        xOffset * (tileSize + brimWidth) + brimWidth , 
        yOffset * (tileSize + brimWidth) + brimWidth, 
        0
    ])
        tile (
            n = definitions[i][0], 
            h = definitions[i][1], 
            brimWidth = brimWidth, 
            brimThickness = brimThickness
        );
}

