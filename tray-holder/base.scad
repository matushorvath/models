include <common.scad>;
include <../common/fillet.scad>

module bevel(position, fillet_size) {
    difference() {
        union() {
            // Bevel body
            cube(position);

            // Bevel fillet
            fillet_position = [
                position[0] + fillet_size,
                position[1] + 2 * fillet_size,
                fillet_size
            ];

            translate([-fillet_size, -fillet_size, 0])
                fillet(fillet_position, [true, false, true, true]);
        }
    }
}

// Base
difference() {
    // Bevel position
    bevel_position = [
        BASE_W2 - (BEVEL_WALL + STICK_W + BEVEL_WALL),
        (BASE_D2 - (BEVEL_WALL + STICK_D + BEVEL_WALL)) / 2,
        BASE_H2
    ];

    union() {
        // Vertical part of base
        translate([0, 0, -BASE_H1])
            cube([BASE_W1, BASE_D1, BASE_H1 + DELTA]);

        // Horizontal part of base
        cube([BASE_W2, BASE_D2, BASE_H2]);

        // Bevel
        translate(bevel_position)
            bevel([
                BEVEL_WALL + STICK_W + BEVEL_WALL,
                BEVEL_WALL + STICK_D + BEVEL_WALL,
                BEVEL_H
            ], BEVEL_FILLET);
    };

    // Bevel hole
    translate(bevel_position)
        translate([BEVEL_WALL, BEVEL_WALL, -(BASE_H2 + DELTA)])
            cube([STICK_W, STICK_D, BASE_H2 + BEVEL_H + 2 * DELTA]);
};
