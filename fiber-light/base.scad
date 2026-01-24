include <common.scad>
include <BOSL/shapes.scad>
include <BOSL/transforms.scad>

module shell(height) {
    bottom_outer_d = TOP_OUTER_D + (ORIG_BOTTOM_OUTER_D - TOP_OUTER_D) * height / ORIG_TOTAL_HEIGHT;

    difference() {
        cyl(h = height, d1 = bottom_outer_d, d2 = TOP_OUTER_D, align = V_UP);
        up(SHELL_WALL) {
            // Leave just the walls
            cyl(h = height - SHELL_WALL + DELTA, d1 = bottom_outer_d - 2 * SHELL_WALL, d2 = TOP_OUTER_D - 2 * SHELL_WALL, align = V_UP);
            // Connector for the transparent top part
            cyl(h = height - SHELL_WALL + DELTA, d = TOP_INNER_D, align = V_UP);
        }
    }
}

module board_holder() {
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

shell(TOTAL_HEIGHT);

board_holder();
