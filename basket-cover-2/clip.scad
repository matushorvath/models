include <common.scad>
include <../common/fillet.scad>

body_r = CLIP_HOLE_R + CLIP_WALL;

interface_l = 2 * body_r + 2 * INTERFACE_MARGIN;
interface_d = CLIP_WIDTH + 2 * INTERFACE_MARGIN;

fillet_l = 2 * body_r + 2 * INTERFACE_FILLET;
fillet_d = CLIP_WIDTH + 2 * INTERFACE_FILLET;

difference () {
    union() {
        // Round part of body
        cylinder(CLIP_WIDTH, body_r, body_r, center = true);

        // Rectangular part of body
        translate([0, body_r / 2, 0])
            cube([2 * body_r, body_r, CLIP_WIDTH], center = true);

        // Interface with the board
        translate([0, body_r + INTERFACE_OFFSET_W + INTERFACE_WIDTH / 2, 0])
            cube([interface_l, INTERFACE_WIDTH, interface_d], center = true);

        // Fillets around the interface
        translate([-fillet_l / 2, body_r + INTERFACE_OFFSET_W + DELTA, -fillet_d / 2])
            rotate([90, 0, 0])
                fillet([fillet_l, fillet_d, INTERFACE_FILLET], sides = [true, true, true, true]);
    }

    union() {
        // Hole round part
        cylinder(CLIP_WIDTH + 2 * DELTA, CLIP_HOLE_R, CLIP_HOLE_R, center = true);

        // Slot
        linear_extrude(height = CLIP_WIDTH + 2 * DELTA, center = true)
            polygon(points = [
                [0, CLIP_HOLE_R], 
                [-30*sin(CLIP_ANGLE), -30*cos(CLIP_ANGLE)],
                [30*sin(CLIP_ANGLE), -30*cos(CLIP_ANGLE)]]);
    }
}
