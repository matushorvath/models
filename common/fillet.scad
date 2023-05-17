include <constants.scad>

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
