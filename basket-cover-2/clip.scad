include <common.scad>
include <connector.scad>

body_r = CLIP_HOLE_R + CLIP_WALL;

difference () {
    union() {
        difference() {
            union() {
                // Clip round part of body
                cylinder(CLIP_WIDTH, body_r, body_r);

                // Clip rectangular part of body
                translate([-body_r, 0, 0])
                    cube([2 * body_r, body_r, CLIP_WIDTH]);
            }

            // Clip reduce size of the rectangular part, it looks better
            translate([-body_r - DELTA, body_r - CLIP_REDUCE, -DELTA])
                cube([2 * body_r + 2 * DELTA, CLIP_WALL, CLIP_WIDTH + 2 * DELTA]);
        }
    }

    union() {
        // Clip hole round part
        translate([0, 0, -DELTA])
            cylinder(CLIP_WIDTH + 2 * DELTA, CLIP_HOLE_R, CLIP_HOLE_R);

        // Slot
        translate([0, 0, -DELTA])
            linear_extrude(height = CLIP_WIDTH + 2 * DELTA)
                polygon(points = [
                    [0, CLIP_HOLE_R], 
                    [-30*sin(CLIP_ANGLE), -30*cos(CLIP_ANGLE)],
                    [30*sin(CLIP_ANGLE), -30*cos(CLIP_ANGLE)]]);
    }
}
