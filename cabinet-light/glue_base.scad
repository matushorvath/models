include <common.scad>
include <BOSL/constants.scad>
use <pins.scad>

module glue_base_body() {
    difference() {
        cuboid([BASE_X, BASE_Y, BASE_Z], fillet = BASE_ROUND, edges = EDGES_Z_ALL, $fn = 24);

        // Remove material from the inside to save time
        translate([0, 0, BASE_WALL_Z])
            cuboid([BASE_X - 2 * BASE_WALL_X, BASE_Y - 2 * BASE_WALL_Y, BASE_Z], fillet = BASE_ROUND, edges = EDGES_Z_ALL, $fn = 24);
    }
}

// module pry_hole(pry_hole_width) {
//     translate([0, 0, -PRY_HOLE_Z / 2 + DELTA])
//         cuboid([PRY_HOLE_LEN, pry_hole_width, PRY_HOLE_Z]);
// }

// module pry_holes() {
//     translate([-(BASE_X - BASE_WALL_X) / 2, 0, 0])
//         rotate([0, 0, 90])
//             pry_hole(BASE_WALL_X + DELTA);
//     translate([ (BASE_X - BASE_WALL_X) / 2, 0, 0])
//         rotate([0, 0, 90])
//             pry_hole(BASE_WALL_X + DELTA);

//     translate([ 0, -(BASE_Y - BASE_WALL_Y) / 2, 0])
//         pry_hole(BASE_WALL_Y + DELTA);
//     translate([ 0,  (BASE_Y - BASE_WALL_Y) / 2, 0])
//         pry_hole(BASE_WALL_Y + DELTA);
// }

module glue_base() {
    difference() {
        translate([0, 0, BASE_Z / 2])
            glue_base_body();
        translate([0, 0, BASE_Z])
            pin_holes();
        // translate([0, 0, BASE_Z])
        //     pry_holes();
    }
}
