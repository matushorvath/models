// w, d, h

module fillet(position, sides = [true, true, true, true]) {
    difference() {
        // Fillet base
        cube([position[0], position[1], position[2]]);

        // Cylindrical shapes to remove from fillet base
        union() {
            if (sides[0])
                translate([0, -delta, position[2]])
                    rotate([-90, 0, 0])
                        cylinder(position[1] + 2 * delta, position[2], position[2]);

            if (sides[1])
                translate([position[0], -delta, position[2]])
                    rotate([-90, 0, 0])
                        cylinder(position[1] + 2 * delta, position[2], position[2]);

            if (sides[2])
                translate([-delta, 0, position[2]])
                    rotate([0, 90, 0])
                        cylinder(position[0] + 2 * delta, position[2], position[2]);

            if (sides[3])
                translate([-delta, position[1], position[2]])
                    rotate([0, 90, 0])
                        cylinder(position[0] + 2 * delta, position[2], position[2]);
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

include <common.scad>;

// Base
difference() {
    // bevel position
    bevel_position = [
        base_w2 - (hole_wall + stick_w + hole_wall),
        (base_d2 - (hole_wall + stick_d + hole_wall)) / 2,
        base_h2
    ];

    union() {
        // Vertical part of base
        translate([0, 0, -base_h1])
            cube([base_w1, base_d1, base_h1 + delta]);

        // Horizontal part of base
        cube([base_w2, base_d2, base_h2]);

        // Bevel
        translate(bevel_position)
            bevel([
                hole_wall + stick_w + hole_wall,
                hole_wall + stick_d + hole_wall,
                hole_h
            ], hole_fillet);
    };

    // Bevel hole
    translate(bevel_position)
        translate([hole_wall, hole_wall, -(base_h2 + delta)])
            cube([stick_w, stick_d, base_h2 + hole_h + 2 * delta]);
};
