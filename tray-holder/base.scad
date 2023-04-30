include <common.scad>;

// w, d, h

// Fitting position
fitting_translation = [
    w2 - (hole_wall + stick_w + hole_wall),
    (d2 - (hole_wall + stick_d + hole_wall)) / 2,
    h2
];

// Base
difference() {
    union() {
        // Vertical part of base
        translate([0, 0, -h1])
            cube([w1, d1, h1 + delta]);

        // Horizontal part of base
        cube([w2, d2, h2]);

        // Fitting bevel
        translate(fitting_translation)
            cube([
                hole_wall + stick_w + hole_wall,
                hole_wall + stick_d + hole_wall,
                hole_h
            ]);
    };

    // Fitting hole
    translate(fitting_translation)
        translate([hole_wall, hole_wall, -(h2 + delta)])
            cube([stick_w, stick_d, h2 + hole_h + 2*delta]);
};
