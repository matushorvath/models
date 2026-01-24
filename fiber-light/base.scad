include <common.scad>
include <BOSL/shapes.scad>
include <BOSL/transforms.scad>

module shell(height) {
    bottom_outer_d = TOP_OUTER_D + (ORIG_BOTTOM_OUTER_D - TOP_OUTER_D) * height / ORIG_TOTAL_HEIGHT;

    difference() {
        cyl(h = height, d1 = bottom_outer_d, d2 = TOP_OUTER_D);
        up(SHELL_WALL / 2) {
            // Leave just the walls
            cyl(h = height - SHELL_WALL + DELTA, d1 = bottom_outer_d - 2 * SHELL_WALL, d2 = TOP_OUTER_D - 2 * SHELL_WALL);
            // Connector for the transparent top part
            cyl(h = height - SHELL_WALL + DELTA, d = TOP_INNER_D);
        }
    }
}

module board_holder() {
    difference() {
        // The holder is carved out of this box
        cuboid([BOARD_X + 2 * BOARD_CORNER_WALL, BOARD_Y + 2 * BOARD_CORNER_WALL, BOARD_Z + BOARD_CORNER_WALL]);

        // Inside cutout
        down(BOARD_CORNER_WALL / 2)
            cuboid([BOARD_X, BOARD_Y, BOARD_Z + DELTA]);
        // Inside roof cutout, everywhere except the front two corners
        left((BOARD_CORNER_LENGTH - BOARD_CORNER_WALL) / 2)
            cuboid([BOARD_X + BOARD_CORNER_WALL - BOARD_CORNER_LENGTH, BOARD_Y, BOARD_Z + BOARD_CORNER_WALL + DELTA]);
        // Long side cutout
        cuboid([BOARD_X + 2 * BOARD_CORNER_WALL - 2 * BOARD_CORNER_LENGTH, BOARD_Y + 2 * BOARD_CORNER_WALL + 2 * DELTA, BOARD_Z + BOARD_CORNER_WALL + DELTA]);
        // Short side cutout
        cuboid([BOARD_X + 2 * BOARD_CORNER_WALL + 2 * DELTA, BOARD_Y + 2 * BOARD_CORNER_WALL - 2 * BOARD_CORNER_LENGTH, BOARD_Z + BOARD_CORNER_WALL + DELTA]);
    }

}

//shell(TOTAL_HEIGHT);

board_holder();
