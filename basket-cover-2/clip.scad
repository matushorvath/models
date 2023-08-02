include <common.scad>
include <connector.scad>
include <../common/fillet.scad>

body_r = CLIP_HOLE_R + CLIP_WALL;

difference () {
    union() {
        // Round part of body
        cylinder(CLIP_WIDTH, body_r, body_r, center = true);

        // Rectangular part of body
        translate([0, body_r / 2, 0])
            cube([2 * body_r, body_r, CLIP_WIDTH], center = true);

        // Connector pins
        translate([CONNECTOR_OFFSET_L, body_r - DELTA, 0])
            rotate([-90, 0, 0])
                connector_pin(CONNECTOR_DEPTH);

        translate([-CONNECTOR_OFFSET_L, body_r - DELTA, 0])
            rotate([-90, 0, 0])
                connector_pin(CONNECTOR_DEPTH);
    }

    union() {
        // Hole round part
        cylinder(CLIP_WIDTH + 2 * DELTA, CLIP_HOLE_R, CLIP_HOLE_R, center = true);

        // Slot
        linear_extrude(height = CLIP_WIDTH + 2 * DELTA, center = true)
            polygon(points = [
                [0, CLIP_HOLE_R],
                [-(body_r + CLIP_HOLE_R)*tan(CLIP_ANGLE), -body_r - DELTA],
                [(body_r + CLIP_HOLE_R)*tan(CLIP_ANGLE), -body_r - DELTA]]);
    }
}
