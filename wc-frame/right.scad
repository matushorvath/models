include <common.scad>
use <frame.scad>
use <connector.scad>

union() {
    difference() {
        frame();

        translate([-(WIDTH / 2 + BORDER + BUMP) / 2, 0, DEPTH / 2 - DELTA])
            cube([WIDTH / 2 + BORDER + BUMP, HEIGHT + 2 * BORDER + 2 * BUMP, DEPTH + 3 * DELTA], center = true);
    }

    translate([0, +(HEIGHT / 2 + BORDER - CONNECTOR_SIZE), - 2 * DELTA])
        connector();
    translate([0, -(HEIGHT / 2 + BORDER - CONNECTOR_SIZE), - 2 * DELTA])
        connector();
}
