# LEGO-based Thermodynamics set - Total and partial differentials

This repository contains OpenSCAD sources to generate tiles for hands-on teaching thermodynamics (integration over d*W*, d*Q*, d*U*).

The tile sizes are of standard Duplo brick, they can be mounted on top of Duplo or Lego bricks. The slope of the top surface is calculated to fit the Lego dimension and connect to neighbouring brick (if chosen correctly).

## Requirements
* Download file ``roundedcube.scad`` from https://danielupshaw.com/openscad-rounded-corners/ and place to the ``vendor`` subdirectory
* Download Doblo factory from http://edutechwiki.unige.ch/en/Doblo_factory (this repo used version 2.4) and place to ``DobloFactory`` subdirectory under the ``vendor``

## Generating the tiles
* Comment/uncomment lines in ``cmdline_tile.scad`` to select correct values of ``midHeight`` and ``slopeN`` for your tile set choice.
  * Create a single tile at given coordinates, e.g. [6;3] by calling ``OpenSCAD_executable" -o stl\tile_6_3.stl -D "x=6" -D "y=3" cmdline_tile.scad`` (on Windows typically use ``"c:\Program Files\OpenSCAD\openscad.com"`` as executable or replace it with your version for other systems)
  * Or create a full set of tiles by calling the ``make_tiles.cmd`` (Windows only)

## The 1.5-high tile
To fit neatly, some tiles require a 1.5-standard height spacer below. Its source is the ``one_and_half_plate.scad`` file.

## Customization
These tiles had been tuned for a single and specific 3D printer (as usual). You might find them perfectly fitting to your LEGO base - or not fitting at all. You can customize all parameters in the ``config.scad`` file, namely

* ``baseType`` - change the underlying LEGO-like tile type (see file for possible values, the difference is in the shape of bottom nops and supports of top plate)
* dimensions of the brick - valid only for baseTypes other than ``"doblo-factory"``
* The bricks are rounded and calculated for a specific layer height and nozzle width, don't forget to update these if using different printer.

## Printed tiles

![Full set of tiles (dQ)](photo/tileset.JPG?raw=true "Full set of tiles (dQ)")

Full set of d*Q* tiles on a plate, without supporting bricks

![Full set of tiles (dU)](photo/tiles_on_supporting_bricks.JPG?raw=true "Full set of tiles (dU)")

Full set of d*U* tiles on a plate, supported by regular LEGO/SUPLO bricks to connect smoothly

![Two ways of integration](photo/two-way-integration.JPG?raw=true "Two ways of integration (dW)")

Two ways of integration (d*W*) over two paths (ideal gas, isobaric first and isothermic and vice versa).


