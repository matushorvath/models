include <common.scad>
include <BOSL/constants.scad>
use <pins.scad>

module glue_base_body() {
    difference() {
        cuboid([BASE_X, BASE_Y, BASE_Z], fillet=BASE_ROUND, edges=EDGES_Z_ALL, $fn=24);

        // Remove material from the inside to save time
        translate([0, 0, BASE_WALL_Z])
            cuboid([BASE_X - 2 * BASE_WALL_X, BASE_Y - 2 * BASE_WALL_Y, BASE_Z], fillet=BASE_ROUND, edges=EDGES_Z_ALL, $fn=24);
    }
}

module glue_base() {
    translate([0, 0, BASE_Z/2])
        glue_base_body();
    translate([0, 0, BASE_Z - DELTA])
        pins();
}

glue_base();
