@ECHO OFF
SET executable="c:\Program Files\OpenSCAD\openscad.com"
SET scadfile=cmdline_tile.scad
SET outputdir=stl

FOR /L %%X IN (0,1,6) DO (
    FOR /L %%Y IN (0,1,6) DO (
        echo "Generating tile at x=%%X y=%%Y"
        %executable% -o %outputdir%\tile_%%X_%%Y.stl -D "x=%%X" -D "y=%%Y" --enable=function-literals %scadfile%
    )
)