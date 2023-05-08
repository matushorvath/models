include <common.scad>;

// w, d, h

module fillet(position, sides = [true, true, true, true]) {
    difference() {
        // Fillet base
        cube([position[0], position[1], position[2]]);

        // Cylindrical shapes to remove from fillet base
        union() {
            if (sides[0])
                translate([0, -DELTA, position[2]])
                    rotate([-90, 0, 0])
                        cylinder(position[1] + 2 * DELTA, position[2], position[2]);

            if (sides[1])
                translate([position[0], -DELTA, position[2]])
                    rotate([-90, 0, 0])
                        cylinder(position[1] + 2 * DELTA, position[2], position[2]);

            if (sides[2])
                translate([-DELTA, 0, position[2]])
                    rotate([0, 90, 0])
                        cylinder(position[0] + 2 * DELTA, position[2], position[2]);

            if (sides[3])
                translate([-DELTA, position[1], position[2]])
                    rotate([0, 90, 0])
                        cylinder(position[0] + 2 * DELTA, position[2], position[2]);
        }
    }
}

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
    // bevel position
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
