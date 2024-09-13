include <common.scad>
use <MCAD/boxes.scad>

// Cave for the chip depth
nfc_cave_z = NFC_Z + RFID_Z + CHIP_CAVE_EXTRA_Z;

module nfc_cave() {
    translate([-CHIP_CAVE_STRAIGHTEN_Z / 2 - DELTA, 0, 0])
        difference() {
            roundedCube([
                HOLE_H + 2 * nfc_cave_z + CHIP_CAVE_STRAIGHTEN_Z,
                HOLE_W + 2 * NFC_COVER_Z + NFC_Z,
                NFC_Y
            ], CAVE_RADIUS, sidesonly=true, center=true);

            union() {
                roundedCube([
                    HOLE_H + CHIP_CAVE_STRAIGHTEN_Z,
                    HOLE_W + 2 * NFC_COVER_Z,
                    NFC_Y + DELTA
                ], INSIDE_RADIUS, sidesonly=true, center=true);

                // Cut off the bottom part of the cave
                translate([-(HOLE_H / 2 + WALL * 3 / 4 - DELTA), 0, 0])
                    cube([WALL + CHIP_CAVE_STRAIGHTEN_Z, NFC_X + DELTA, NFC_Y + DELTA], center=true);
            }
        }
}

difference() {
    difference() { // add % here to see inside
        // Body
        translate([WALL_ADD_TOP / 2, 0, 0])
            minkowski() {
                roundedCube([
                    HOLE_H + 2 * WALL + WALL_ADD_TOP - 2 * EDGE_RADIUS,
                    HOLE_W + 2 * WALL - 2 * EDGE_RADIUS,
                    DEPTH - 2 * EDGE_RADIUS
                ], OUTSIDE_RADIUS, sidesonly=true, center=true);

                sphere(r = EDGE_RADIUS);
            }

        // Hole
        roundedCube([
            HOLE_H,
            HOLE_W,
            DEPTH + DELTA
        ], INSIDE_RADIUS, sidesonly=true, center=true);
    }

    union() {
        // NFC sticker hole
        nfc_cave();

        rotate([90, 0, 90])
            // RFID antena
            translate([-RFID_CHIP_X / 2, 0, HOLE_H / 2 + nfc_cave_z - NFC_Z - RFID_Z / 2])
                difference() {
                    // Antena space
                    cylinder(h = RFID_Z, r = RFID_OUTSIDE_R, center=true);

                    // Antena middle
                    //cylinder(h = RFID_Z + DELTA, r = RFID_INSIDE_R, center=true);
                }
    }
}

// Icon
translate([
    HOLE_H / 2 + WALL + WALL_ADD_TOP - DELTA,
    //HOLE_W / 2 + WALL - OUTSIDE_RADIUS - ICON_X / 2,
    -RFID_CHIP_X / 2,
    0
])
    rotate([90, 0, 90])
        resize([ICON_X, ICON_Y, ICON_Z])
            //surface(file="wifi-inverted.png", center=true);
            surface(file="security-inverted.png", center=true);
