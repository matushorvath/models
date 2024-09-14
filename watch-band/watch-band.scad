include <common.scad>
use <MCAD/boxes.scad>

module chip_cave() {
    difference() {
        translate([-(CHIP_CAVE_CUTOFF_X - CHIP_CAVE_X)/ 2, 0, 0])
            roundedCube([
                HOLE_X + CHIP_CAVE_X + CHIP_CAVE_CUTOFF_X,
                HOLE_Y + 2 * CHIP_CAVE_Y,
                CHIP_CAVE_Z
            ], CAVE_RADIUS, sidesonly=true, center=true);

        // Cut off the bottom part of the cave
        translate([- (CHIP_CAVE_CUTOFF_X + HOLE_X) / 2, 0, 0])
            cube([
                CHIP_CAVE_CUTOFF_X + DELTA,
                HOLE_Y + 2 * CHIP_CAVE_Y + DELTA,
                CHIP_CAVE_Z + DELTA
            ], center=true);
    }
}

band_z = CHIP_CAVE_Z + 2 * CAVE_BORDER;

difference() {
    difference() { // add % here to see inside
        // Body
        translate([(WALL_TOP - WALL_BOTTOM) / 2, 0, 0])
            minkowski() {
                roundedCube([
                    HOLE_X + WALL_TOP + WALL_BOTTOM - 2 * EDGE_RADIUS,
                    HOLE_Y + 2 * WALL_SIDE - 2 * EDGE_RADIUS,
                    band_z - 2 * EDGE_RADIUS
                ], OUTSIDE_RADIUS, sidesonly=true, center=true);

                sphere(r = EDGE_RADIUS);
            }

        // Hole
        roundedCube([
            HOLE_X,
            HOLE_Y,
            band_z + DELTA
        ], INSIDE_RADIUS, sidesonly=true, center=true);
    }

    // NFC and RFID chip cave
    chip_cave();
}

// Icon
translate([    // add * here to speed up preview
    HOLE_X / 2 + WALL_TOP - DELTA,
    0,
    0
])
    rotate([90, 0, 90])
        resize([ICON_X, ICON_Y, ICON_Z])
            surface(file="icons/wifi-inverted.png", center=true);
            //surface(file="icons/security-inverted.png", center=true);
