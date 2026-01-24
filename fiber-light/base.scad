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

shell(TOTAL_HEIGHT);
