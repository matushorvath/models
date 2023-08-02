include <common.scad>
include <connector.scad>
include <../common/fillet.scad>

body_r = CLIP_HOLE_R + CLIP_WALL;

interface_l = 2 * body_r + 2 * INTERFACE_MARGIN;
interface_d = CLIP_WIDTH + 2 * INTERFACE_MARGIN;

fillet_l = 2 * body_r + 2 * INTERFACE_FILLET;
fillet_d = CLIP_WIDTH + 2 * INTERFACE_FILLET;

difference() {
    union() {
        // Interface with the board
        translate([0, 0, INTERFACE_WIDTH / 2])
            cube([interface_l, interface_d, INTERFACE_WIDTH], center = true);

        // Fillets around the interface
        translate([-fillet_l / 2, -fillet_d / 2, INTERFACE_WIDTH - DELTA])
            fillet([fillet_l, fillet_d, INTERFACE_FILLET], sides = [true, true, true, true]);
    }

    // Connector holes
    translate([CONNECTOR_OFFSET_L, 0, INTERFACE_WIDTH + INTERFACE_FILLET])
        rotate([180, 0, 0])
            connector_hole(CONNECTOR_DEPTH + NORMAL_FIT);

    translate([-CONNECTOR_OFFSET_L, 0, INTERFACE_WIDTH + INTERFACE_FILLET])
        rotate([180, 0, 0])
            connector_hole(CONNECTOR_DEPTH + NORMAL_FIT);
}
