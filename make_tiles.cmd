@ECHO OFF
SET executable="c:\Program Files\OpenSCAD\openscad.com"
SET scadfile=cmdline_tile.scad
SET outputdir=stl

FOR /L %%Y IN (6,-1,0) DO (
    FOR /L %%X IN (6,-1,0) DO (
        echo "Generating tile at x=%%X y=%%Y"
        %executable% -o %outputdir%\tile_%%X_%%Y.stl -D "x=%%X" -D "y=%%Y" --enable=function-literals %scadfile%
    )
)