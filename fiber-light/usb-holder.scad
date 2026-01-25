include <common.scad>
include <BOSL/shapes.scad>
include <BOSL/transforms.scad>

module usb_holder() {
    difference() {
        // The holder is carved out of this box
        cuboid([
            BOARD_X + 2 * BOARD_CORNER_WALL,
            BOARD_Y + 2 * BOARD_CORNER_WALL,
            BOARD_Z + BOARD_CORNER_WALL
        ], align = V_UP + V_RIGHT);

        down(DELTA) {
            // Inside cutout
            right(BOARD_CORNER_WALL) {
                cuboid([BOARD_X, BOARD_Y, BOARD_Z], align = V_UP + V_RIGHT);

            // Inside roof cutout, everywhere except the front two corners
            right(BOARD_CORNER_LENGTH)
                cuboid([
                    BOARD_X - BOARD_CORNER_LENGTH,
                    BOARD_Y,
                    BOARD_Z + BOARD_CORNER_WALL + 2 * DELTA
                ], align = V_UP + V_RIGHT);
            }

            // Long side cutout
            right(BOARD_CORNER_LENGTH)
                cuboid([
                    BOARD_X + 2 * BOARD_CORNER_WALL - 2 * BOARD_CORNER_LENGTH,
                    BOARD_Y + 2 * BOARD_CORNER_WALL + 2 * DELTA,
                    BOARD_Z + BOARD_CORNER_WALL + 2 * DELTA
                ], align = V_UP + V_RIGHT);

            // Short side cutout
            left(DELTA)
                cuboid([
                    BOARD_X + 2 * BOARD_CORNER_WALL + 2 * DELTA,
                    BOARD_Y + 2 * BOARD_CORNER_WALL - 2 * BOARD_CORNER_LENGTH,
                    BOARD_Z + BOARD_CORNER_WALL + 2 * DELTA
                ], align = V_UP + V_RIGHT);
        }
    }

    yflip_copy()
        move([PIN_X, BOARD_Y / 2 - PIN_Y, 0])
            cylinder(h = BOARD_Z, d = PIN_D);

    // TODO connector - plate between the roofed corners + connector hole + correct depth for the hole/plate
}

//usb_holder();
