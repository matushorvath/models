include <common.scad>;
include <../common/fillet.scad>

module bevel(position, fillet_size) {
    // Bevel body
    cube(position);

    // Bevel fillet
    fillet_position = [
        position[0] + fillet_size,
        position[1],
        fillet_size
    ];

    translate([-fillet_size, 0, 0])
        fillet(fillet_position, [true, false, false, false]);
}

// Base
difference() {
    // Bevel position and size
    bevel_size = [
        BEVEL_WALL + STICK_W + BEVEL_WALL,
        BASE_D2,
        BEVEL_H
    ];

    bevel_position = [
        BASE_W2 - bevel_size[0],
        BASE_D2 - bevel_size[1],
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
            bevel(bevel_size, BEVEL_FILLET);
    };

    // Bevel hole
    translate(bevel_position)
        translate([BEVEL_WALL, (bevel_size[1] - STICK_D) / 2, -(BASE_H2 + DELTA)])
            cube([STICK_W, STICK_D, BASE_H2 + BEVEL_H + 2 * DELTA]);
};
