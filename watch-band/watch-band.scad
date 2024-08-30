include <common.scad>
use <MCAD/boxes.scad>

difference() {
    difference() { // add % here to see the RFID
        // Body
        minkowski() {
            roundedCube([
                HOLE_H + 2 * WALL - 2 * EDGE_RADIUS,
                HOLE_W + 2 * WALL - 2 * EDGE_RADIUS,
                DEPTH - 2 * EDGE_RADIUS
            ], OUTSIDE_RADIUS, sidesonly=true, center=true);

            sphere(r = EDGE_RADIUS);
        }

        // Hole
        roundedCube([
            HOLE_H /*- 2 * EDGE_RADIUS*/,
            HOLE_W /*- 2 * EDGE_RADIUS*/,
            DEPTH + DELTA/*- 2 * EDGE_RADIUS*/
        ], INSIDE_RADIUS, sidesonly=true, center=true);
    }

    rfid_translate_z = HOLE_H / 2 + (WALL - RFID_Z) / 2;

    rotate([90, 0, 90])
        union() {
            // RFID antena
            translate([RFID_CHIP_X / 2, 0, rfid_translate_z])
                difference() {
                    // Antena space
                    cylinder(h = RFID_Z, r = RFID_OUTSIDE_R, center=true);
                    // Antena middle
                    cylinder(h = RFID_Z + DELTA, r = RFID_INSIDE_R, center=true);
                }

            // RFID chip
            translate([-RFID_OUTSIDE_R, 0, rfid_translate_z])
                cube(size = [RFID_CHIP_X, RFID_CHIP_Y, RFID_Z], center=true);
        }
}

// Pin
rotate([0, 90, 0])
    translate([0, 0, HOLE_H / 2 - PIN_Z / 2 + DELTA])
        union() {
            cube([PIN_Y, PIN_X, PIN_Z], center=true);

            translate([0, -PIN_X / 2, 0])
                cylinder(h = PIN_Z, r = PIN_Y / 2, center=true);

            translate([0, PIN_X / 2, 0])
                cylinder(h = PIN_Z, r = PIN_Y / 2, center=true);
        }


// BARRIER_R = BIG_R + BARRIER_WIDTH;
// BASE_WIDTH = BARRIER_R * 2 + BASE_EXTRA;

// difference() {
//     union() {
//         // Base
//         translate(v = [0, 0, -(RING_HEIGHT - BASE_HEIGHT) / 2])
//             cube(size = [BASE_WIDTH, BASE_WIDTH, BASE_HEIGHT], center = true);

//         // Outside cylinder
//         cylinder(h = RING_HEIGHT, r = BARRIER_R, center = true);
//     }

//     // Inside cylinder
//     cylinder(h = RING_HEIGHT + DELTA, r1 = SMALL_R + RING_FIT, r2 = BIG_R + RING_FIT, center = true);

//     // Cut off
//     translate(v = [(BASE_WIDTH - BASE_CUT) / 2, 0, 0])
//         cube(size = [BASE_CUT + DELTA, BASE_WIDTH + DELTA, RING_HEIGHT + 2 * DELTA], center = true);
// }
