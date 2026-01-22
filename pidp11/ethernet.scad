include <common.scad>
include <BOSL/shapes.scad>

use <plate.scad>

ETH_X = 33.5;
ETH_Y = 20.5;
ETH_Z = 1.5;

ETH_CONN_X = 16.5;
ETH_CONN_Y = 13.5;

ETH_SCREW_DIST = 25;
ETH_SCREW_D = 4;

plate(ETH_X, ETH_Y, ETH_Z, ETH_CONN_X, ETH_CONN_Y, ETH_SCREW_DIST, ETH_SCREW_D);
