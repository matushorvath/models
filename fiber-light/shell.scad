include <common.scad>
include <BOSL/shapes.scad>
include <BOSL/transforms.scad>

function shell_bottom_outer_d(height) = TOP_OUTER_D + (ORIG_BOTTOM_OUTER_D - TOP_OUTER_D) * height / ORIG_TOTAL_HEIGHT;

module shell(height) {
    bottom_outer_d = shell_bottom_outer_d(height);

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

module shell_mask(height) {
    bottom_outer_d = shell_bottom_outer_d(height);

    cyl(h = height, d1 = bottom_outer_d, d2 = TOP_OUTER_D, align = V_UP);
}

shell(TOTAL_HEIGHT);
