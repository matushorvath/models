include <common.scad>;
include <connector.scad>;

body_r = CLIP_HOLE_R + CLIP_WALL;

difference() {
    // Bar body
    cube([BAR_LENGTH, BAR_WIDTH, BAR_WIDTH]);

    union() {
        // Connector holes for the clip
        translate([BAR_CLIP_POS - body_r / 2, -DELTA, BAR_WIDTH / 2])
            rotate([-90, 0, 0])
                connector_hole(CLIP_CONNECTOR_DEPTH);

        translate([BAR_CLIP_POS + body_r / 2, -DELTA, BAR_WIDTH / 2])
            rotate([-90, 0, 0])
                connector_hole(CLIP_CONNECTOR_DEPTH);

        // Connector through hole for potential 90 degree rear bar
        translate([BAR_WIDTH / 2, BAR_WIDTH / 2, -DELTA])
            rotate([0, 0, 0])
                connector_hole(BAR_WIDTH + 2 * DELTA);

        // Connector hole for front half of the bar
        translate([BAR_LENGTH + DELTA, BAR_WIDTH / 2, BAR_WIDTH / 2])
            rotate([0, -90, 0])
                connector_hole(BAR_CONNECTOR_DEPTH);
    }
}
