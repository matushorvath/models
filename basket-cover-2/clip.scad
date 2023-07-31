include <common.scad>
include <connector.scad>

body_r = CLIP_HOLE_R + CLIP_WALL;

interface_l = 2 * body_r + 2 * INTERFACE_MARGIN;
interface_d = CLIP_WIDTH + 2 * INTERFACE_MARGIN;

difference () {
    union() {
        // Round part of body
        cylinder(CLIP_WIDTH, body_r, body_r);

        // Rectangular part of body
        translate([-body_r, 0, 0])
            cube([2 * body_r, body_r, CLIP_WIDTH]);

        // Interface with the board
        translate([-interface_l / 2, body_r - DELTA, -interface_d / 2 + CLIP_WIDTH / 2])
            cube([interface_l, INTERFACE_WIDTH, interface_d]);
    }

    union() {
        // Hole round part
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
