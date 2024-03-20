include <common.scad>
use <frame.scad>
use <connector.scad>

difference() {
    frame();

    translate([(WIDTH / 2 + BORDER + BUMP) / 2, 0, DEPTH / 2])
        cube([WIDTH / 2 + BORDER + BUMP, HEIGHT + 2 * BORDER + 2 * BUMP, DEPTH + 4 * DELTA], center = true);

    translate([0, +(HEIGHT / 2 + BORDER - CONNECTOR_SIZE), - 2 * DELTA])
        connector(OUTER_FRAME + 2 * DELTA);
    translate([0, -(HEIGHT / 2 + BORDER - CONNECTOR_SIZE), - 2 * DELTA])
        connector(OUTER_FRAME + 2 * DELTA);
}
