include <common.scad>;
include <../common/fillet.scad>

module bevel(position, fillet_size) {
    // Bevel body
    cube(position);

    // Bevel fillet
    fillet_position = [
        position[0] + 2 * fillet_size,
        position[1] + 2 * fillet_size,
        fillet_size
    ];

    translate([-fillet_size, -fillet_size, 0])
        fillet(fillet_position, [true, true, true, true]);
}

// Base
difference() {
    // Bevel position and size
    bevel_size = [
        BEVEL_WALL + STICK_W + BEVEL_WALL,
        BEVEL_WALL + STICK_D + BEVEL_WALL,
        BEVEL_H
    ];

    bevel_position = [
        (TOP_BASE_W - bevel_size[0]) / 2,
        (TOP_BASE_D - bevel_size[1]) / 2,
        TOP_BASE_H
    ];

    union() {
        // Horizontal part of base
        cube([TOP_BASE_W, TOP_BASE_D, TOP_BASE_H]);

        // Bevel
        translate(bevel_position)
            bevel(bevel_size, BEVEL_FILLET);
    };

    // Bevel hole
    translate(bevel_position)
        translate([BEVEL_WALL, (bevel_size[1] - STICK_D) / 2, -(TOP_BASE_H + DELTA)])
            cube([STICK_W, STICK_D, TOP_BASE_H + BEVEL_H + 2 * DELTA]);
};
