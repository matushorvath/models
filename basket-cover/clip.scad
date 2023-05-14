include <common.scad>
include <connector.scad>

body_r = CLIP_HOLE_R + CLIP_WALL;

module clip_connector_pin() {
    translate([0, body_r - CLIP_REDUCE, BAR_WIDTH / 2])
        rotate([-90, 0, 0])
            connector_pin(CLIP_CONNECTOR_DEPTH);
}

difference () {
    union() {
        difference() {
            union() {
                // Clip round part of body
                cylinder(BAR_WIDTH, body_r, body_r);

                // Clip rectangular part of body
                translate([-body_r, 0, 0])
                    cube([2 * body_r, body_r, BAR_WIDTH]);
            }

            // Clip reduce size of the rectangular part, it looks better
            translate([-body_r - DELTA, body_r - CLIP_REDUCE, -DELTA])
                cube([2 * body_r + 2 * DELTA, CLIP_WALL, BAR_WIDTH + 2 * DELTA]);
        }

        translate([-body_r / 2, 0, 0])
            clip_connector_pin();
        translate([body_r / 2, 0, 0])
            clip_connector_pin();
    }

    union() {
        // Clip hole round part
        translate([0, 0, -DELTA])
            cylinder(BAR_WIDTH + 2 * DELTA, CLIP_HOLE_R, CLIP_HOLE_R);

        // Slot
        translate([0, 0, -DELTA])
            linear_extrude(height = BAR_WIDTH + 2 * DELTA)
                polygon(points = [
                    [0, CLIP_HOLE_R], 
                    [-30*sin(CLIP_ANGLE), -30*cos(CLIP_ANGLE)],
                    [30*sin(CLIP_ANGLE), -30*cos(CLIP_ANGLE)]]);
    }
}
